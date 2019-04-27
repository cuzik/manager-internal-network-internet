class SwitchesController < ApplicationController
  before_action :set_switch, only: [:show, :edit, :update, :destroy]

  def index
    @switches = current_account.switches.order(:name)

    authorize @switches
  end

  def show
    authorize @switch

    @ports = @switch.ports.order(:number)
  end

  def new
    authorize Switch

    @switch = Switch.new
  end

  def edit
    authorize @switch
  end

  def create
    @switch = current_account.switches.new(switch_params)

    authorize @switch

    if @switch.save
      flash[:success] = I18n.t('controllers.switches.create.success')

      redirect_to(switches_path)
    else
      flash[:error] = I18n.t('controllers.switches.create.error')

      render(:new)
    end
  end

  def update
    authorize @switch

    if @switch.update(switch_params)
      flash[:success] = I18n.t('controllers.switches.update.success')

      redirect_to(@switch)
    else
      flash[:error] = I18n.t('controllers.switches.update.error')

      redirect_to(edit_switch_path)
    end
  end

  def destroy
    authorize @switch

    if @switch.destroy!
      flash[:success] = I18n.t('controllers.switches.destroy.success')

      redirect_to(switches_path)
    else
      flash[:error] = I18n.t('controllers.switches.destroy.error')

      redirect_to(switch_path(@switch))
    end

  end

  private
    def set_switch
      @switch = Switch.find(params[:id])
    end

    def switch_params
      params.require(:switch).permit(:name, :mac_address)
    end
end

class SwitchesController < ApplicationController
  before_action :set_switch, only: [:show, :edit, :update, :destroy]

  def index
    @switches = current_account.switches
  end

  def show
    @ports = @switch.ports.order(:number)
  end

  def new
    @switch = Switch.new
    @switches = current_account.switches
  end

  def edit
  end

  def create
    @switch = current_account.switches.new(switch_params)

    if @switch.save
      flash[:success] = I18n.t('controllers.switches.create.success')

      redirect_to(switches_path)
    else
      flash[:error] = I18n.t('controllers.switches.create.error')

      redirect_to(new_switch_path)
    end
  end

  def update
    if @switch.update(switch_params)
      flash[:success] = I18n.t('controllers.switches.update.success')

      redirect_to(@switch)
    else
      flash[:error] = I18n.t('controllers.switches.update.error')

      redirect_to(edit_switch_path)
    end
  end

  def destroy
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

class PortsController < ApplicationController
  before_action :set_port, only: [:show, :edit, :update, :destroy]

  def index
    @ports = current_account.ports

    authorize @ports
  end

  def show
    authorize @port
  end

  def new
    authorize Port

    @port = Port.new
  end

  def edit
  end

  def create
    @port = Port.new(port_params)

    authorize @port

    if @port.save
      flash[:success] = I18n.t('controllers.ports.create.success')

      redirect_to(switch_path(port_params[:switch_id]))
    else
      flash[:error] = I18n.t('controllers.ports.create.error')

      redirect_to(new_port_path)
    end
  end

  def update
    authorize @port

    if @port.update(port_params)
      flash[:success] = I18n.t('controllers.ports.update.success')

      redirect_to(@port)
    else
      flash[:error] = I18n.t('controllers.ports.update.error')

      render(:edit)
    end
  end

  def destroy
    authorize @port

    switch_id = @port.switch.id
    if @port.destroy!
      flash[:success] = I18n.t('controllers.ports.destroy.success')

      redirect_to(switch_path(switch_id))
    else
      flash[:error] = I18n.t('controllers.ports.destroy.error')

      redirect_to(@port)
    end
  end

  private
    def set_port
      @port = Port.find(params[:id])
    end

    def port_params
      params.require(:port).permit(:number, :enabled, :editable, :switch_id)
    end
end

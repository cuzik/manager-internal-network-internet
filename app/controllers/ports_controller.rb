class PortsController < ApplicationController
  before_action :set_port, only: [:show, :edit, :update, :destroy]

  def index
    @ports = current_account.switches.flat_map{|switch| switch.ports}
  end

  def show
  end

  def new
    @port = Port.new
  end

  def edit
  end

  def create
    @port = Port.new(port_params)

    if @port.save
      flash[:success] = I18n.t('controllers.ports.create.success')

      redirect_to(switch_path(port_params[:switch_id]))
    else
      flash[:error] = I18n.t('controllers.ports.create.error')

      redirect_to(new_port_path)
    end
  end

  def update
    if @port.update(port_params)
      flash[:success] = I18n.t('controllers.ports.update.success')

      redirect_to(@port)
    else
      flash[:error] = I18n.t('controllers.ports.update.error')

      redirect_to(edit_port_path)
    end
  end

  def destroy
    switch_id = @port.switch.id
    if @port.destroy!
      flash[:success] = I18n.t('controllers.ports.destroy.success')

      redirect_to(switch_path(switch_id))
    else
      flash[:error] = I18n.t('controllers.ports.destroy.error')

      redirect_to(port_path(@port))
    end
  end

  private
    def set_port
      @port = Port.find(params[:id])
    end

    def port_params
      params.require(:port).permit(:number, :enabled, :editabled, :switch_id)
    end
end

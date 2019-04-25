class PortsController < ApplicationController
  before_action :set_port, only: [:show, :edit, :update, :destroy]

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

      redirect_to(ports_path)
    else
      flash[:error] = I18n.t('controllers.ports.create.error')

      redirect_to(new_room_path)
    end
  end

  def update
    if @port.update(port_params)
      flash[:success] = I18n.t('controllers.ports.update.success')

      redirect_to(@port)
    else
      flash[:error] = I18n.t('controllers.ports.update.error')

      redirect_to(edit_room_path)
    end
  end

  def destroy
    if @port.destroy!
      flash[:success] = I18n.t('controllers.ports.destroy.success')

      redirect_to(ports_path)
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
      params.require(:port).permit(:number, :enabled, :editable)
    end
end

class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
    @rooms = current_account.rooms
  end

  def show
  end

  def new
    @room = Room.new
  end

  def edit
  end

  def create
    @room = current_account.rooms.new(room_params)

    if @room.save
      flash[:success] = I18n.t('controllers.rooms.create.success')

      redirect_to(rooms_path)
    else
      render :new
    end
  end

  def update
    if @room.update(room_params)
      flash[:success] = I18n.t('controllers.rooms.update.success')

      redirect_to(@room)
    else
      render :edit
    end
  end

  def destroy
    @room.destroy

    flash[:success] = I18n.t('controllers.rooms.update.success')

    redirect_to(rooms_path)
  end

  private
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(
        :name
      )
    end
end

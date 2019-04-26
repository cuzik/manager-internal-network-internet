class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
    @rooms = current_account.rooms.order(:name)
  end

  def show
    @computers = @room.computers.order(:name)
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
      flash[:error] = I18n.t('controllers.rooms.create.error')

      redirect_to(new_room_path)
    end
  end

  def update
    if @room.update(room_params)
      flash[:success] = I18n.t('controllers.rooms.update.success')

      redirect_to(@room)
    else
      flash[:error] = I18n.t('controllers.rooms.update.error')

      redirect_to(edit_room_path)
    end
  end

  def destroy
    if @room.destroy!
      flash[:success] = I18n.t('controllers.rooms.destroy.success')

      redirect_to(rooms_path)
    else
      flash[:error] = I18n.t('controllers.rooms.destroy.error')

      redirect_to(room_path(@room))
    end
  end

  private
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:name)
    end
end

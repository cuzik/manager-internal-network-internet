class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
    @rooms = current_account.rooms.order(:name)

    authorize @rooms
  end

  def show
    authorize @room

    @computers = @room.computers.order(:name)
  end

  def new
    authorize Room

    @room = Room.new
  end

  def edit
    authorize @rooms
  end

  def create
    @room = current_account.rooms.new(room_params)

    authorize @room

    if @room.save
      flash[:success] = I18n.t('controllers.rooms.create.success')

      redirect_to(rooms_path)
    else
      flash[:error] = I18n.t('controllers.rooms.create.error')

      render(:new)
    end
  end

  def update
    authorize @rooms

    if @room.update(room_params)
      flash[:success] = I18n.t('controllers.rooms.update.success')

      redirect_to(@room)
    else
      flash[:error] = I18n.t('controllers.rooms.update.error')

      redirect_to(edit_room_path)
    end
  end

  def destroy
    authorize @rooms

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

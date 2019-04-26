class ComputersController < ApplicationController
  before_action :set_computer, only: [:show, :edit, :update, :destroy]

  def index
    @computers = current_account.computers
  end

  def show
  end

  def new
    @computer = Computer.new
  end

  def edit
  end

  def create
    @computer = current_account.computers.new(computer_params)

    if @computer.save
      flash[:success] = I18n.t('controllers.computers.create.success')

      redirect_to(computers_path)
    else
      flash[:error] = I18n.t('controllers.computers.create.error')

      redirect_to(new_computer_path)
    end
  end

  def update
    if @computer.update(computer_params)
      flash[:success] = I18n.t('controllers.computers.update.success')

      redirect_to(@computer)
    else
      flash[:error] = I18n.t('controllers.computers.update.error')

      redirect_to(edit_computer_path)
    end
  end

  def destroy
    if @computer.destroy!
      flash[:success] = I18n.t('controllers.computers.destroy.success')

      redirect_to(computers_path)
    else
      flash[:error] = I18n.t('controllers.computers.destroy.error')

      redirect_to(computer_path(@computer))
    end
  end

  private
    def set_computer
      @computer = Computer.find(params[:id])
    end

    def computer_params
      params.require(:computer).permit(
        :name,
        :mac_address,
        :ip,
        :owner,
        :room,
        :port
      )
    end
end
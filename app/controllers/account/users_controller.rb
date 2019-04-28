class Account::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = current_account.users.order(:name)

    authorize @users
  end

  def show
    authorize @user
  end

  def new
    authorize User

    @user = User.new
  end

  def edit
    authorize @user
  end

  def create
    @user = current_account.users.new(user_params)

    authorize @user

    if @user.save
      flash[:success] = I18n.t('controllers.account.users.create.success')

      redirect_to(account_users_path)
    else
      flash[:error] = I18n.t('controllers.account.users.create.error')

      render(:new)
    end
  end

  def update
    authorize @user

    if @user.update(user_params)
      flash[:success] = I18n.t('controllers.account.users.update.success')

      redirect_to(@user)
    else
      flash[:error] = I18n.t('controllers.account.users.update.error')

    render(:edit)
    end
  end

  def destroy
    authorize @user

    if @user.destroy!
      flash[:success] = I18n.t('controllers.account.users.destroy.success')

      redirect_to(account.users_path)
    else
      flash[:error] = I18n.t('controllers.account.users.destroy.error')

      redirect_to(@user)
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name,
      :cpf,
      :email,
      :password
    )
  end
end

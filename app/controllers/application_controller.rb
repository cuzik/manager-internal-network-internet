class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protect_from_forgery with: :exception

  before_action :authenticate_user!

  layout -> { devise_controller? && !user_signed_in? ? 'devise' : 'application' }

  def current_account
    current_user.account
  end

  private

  def user_not_authorized(_exception)
    flash[:alert] = t('pundit.not_authorized')
    redirect_to(request.referer || root_path)
  end
end

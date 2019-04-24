class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  layout -> { devise_controller? && !user_signed_in? ? 'devise' : 'application' }

  def current_account
    current_user.account
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery

  def check_valid_user
    authenticate_user!
  end

  def check_valid_admin
    authenticate_user!
    head :unauthorized unless current_user.is_admin
  end
end

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  # def logged_in?
  #   user_signed_in?
  # end

  # helper_method :current_user, :logged_in?, :user_signed_in?

  # def current_user
  #   @current_user ||= Author.find(session[:user_id]) if session[:user_id]
  # end

  # def logged_in?
  #   !!current_user
  # end

  # def require_user
  #   if !logged_in?
  #     flash[:danger] = "You must be logged in to perform that action"
  #     redirect_to root_path
  #   end
  # end

end

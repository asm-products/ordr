class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authorize
    redirect_to login_path, alert: "Not authorized!" unless current_user
  end
  
private
  def current_user
    @current_user ||= User.find(session[:user]) if session[:user]
  end
  helper_method :current_user
end

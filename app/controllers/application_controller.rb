class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  Mongoid.raise_not_found_error = false

  def authorize(user = nil)
    if user
      redirect_to login_path, alert: t("session.messages.unauthorized") unless current_user == user
    else
      redirect_to login_path, alert: t("session.messages.unauthorized") unless current_user
    end
  end
  helper_method :authorize

private
  def current_user
    @current_user ||= User.find(session[:user]) if session[:user]
  end
  helper_method :current_user
end

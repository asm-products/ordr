class SessionsController < ApplicationController
  def new
  end

  def create
    if request.env['omniauth.auth']
      login_with_omniauth
    else
      login_with_password
    end
  end

  def failure
    redirect_to login_path, alert: t("session.failed_login.omniauth")
  end

  def destroy
    session[:user] = nil
    redirect_to login_path, notice: t("session.logout")
  end

private
  def login_with_omniauth
    auth_hash = request.env['omniauth.auth']

    if session[:user]
      begin
        user = find_user(session[:user])
      rescue
        flash[:alert] = t("general_errors.not_in_database", thing: "User")
        redirect_to and return login_path
      end
      user.add_provider(auth_hash)
      redirect_to jobs_path, notice: t('session.returning_user.omniauth', user: user.name, provider: auth_hash["provider"])
    else
      auth = Authentication.find_or_create(auth_hash)
      session[:user] = auth.user_id.to_s
      redirect_to jobs_path, notice: t('session.new_user.omniauth', user: auth.user.name, provider: auth_hash["provider"])
    end
  end

  def login_with_password
    begin
      user = User.find_by(email: params[:email])
    rescue
      flash[:alert] = t("general_errors.not_in_database", thing: "User")
      redirect_to and return login_path
    end
    if user && user.authenticate(params[:password])
      session[:user] = user.id.to_s
      redirect_to jobs_path, notice: t("session.returning_user.email", email: user.email)
    else
      flash[:alert] = t("session.failed_login.email")
      render "sessions/new"
    end
  end
end

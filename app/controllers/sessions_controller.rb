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
    redirect_to login_path, alert: "In order to log you in, we need permission to access your account."
  end

  def destroy
    session[:user] = nil
    redirect_to login_path, notice: "Logged out!"
  end

private
  def login_with_omniauth
    auth_hash = request.env['omniauth.auth']

    if session[:user]
      begin
        user = find_user(session[:user])
      rescue
        flash[:alert] = "User not found!"
        redirect_to and return login_path
      end
      user.add_provider(auth_hash)
      redirect_to user_path(current_user), notice: "Welcome back #{user.name}. You are signed in using #{auth_hash["provider"]}."
    else
      auth = Authentication.find_or_create(auth_hash)
      session[:user] = auth.user_id.to_s
      redirect_to user_path(current_user), notice: "Hello, #{auth.user.name}. You are now signed in."
    end
  end

  def login_with_password
    begin
      user = User.find_by(email: params[:email])
    rescue
      flash[:alert] = "User not found!"
      redirect_to and return login_path
    end
    if user && user.authenticate(params[:password])
      session[:user] = user.id.to_s
      redirect_to user_path(current_user), notice: "Thank you for signing in, #{user.email}"
    else
      flash[:alert] = "Email or password is invalid!"
      render "sessions/new"
    end
  end
end

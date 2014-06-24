class SessionsController < ApplicationController
  def new
  end

  def create
    if request.env['omniauth.auth']
      create_omniauth
    else
      create_password_login
    end
  end

  def failure
    redirect_to login_path, notice: "In order to log you in, we need permission to access your account."
  end

  def destroy
    session[:user] = nil
    redirect_to login_path, notice: "Logged out!"
  end

private
  def create_omniauth
    auth_hash = request.env['omniauth.auth']

    if session[:user]
      begin
        user = User.find(session[:user]["$oid"])
      rescue
        redirect_to and return login_path, alert: "User not found!"
      end
      user.add_provider(auth_hash)
      user.save
      redirect_to login_path, notice: "Welcome back #{user.name}. You are signed in using #{auth_hash["provider"]}."
    else
      auth = Authentication.find_or_create(auth_hash)
      session[:user] = auth.user_id
      redirect_to login_path, notice: "Hello, #{auth.user.name}. You are now signed in."
    end
  end

  def create_password_login
    begin
      user = User.find_by(email: params[:email])
    rescue
      redirect_to and return login_path, alert: "User not found!"
    end
    if user && user.authenticate(params[:password])
      session[:user] = user.id
      redirect_to login_path, notice: "Thank you for signing in, #{user.email}"
    else
      render "/login", alert: "Email or password is invalid!"
    end
  end
end

class SessionsController < ApplicationController
  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']

    if session[:user]
      user = User.find(session[:user]["$oid"])
      user.add_provider(auth_hash)
      user.save
      redirect_to "/login", notice: "Welcome back #{user.name}. You are signed in using #{auth_hash["provider"]}."
    else
      auth  = Authentication.find_or_create(auth_hash)
      session[:user] = auth.user_id
      redirect_to "/login", notice: "Hello, #{auth.user.name}. You are now signed in."
    end
  end

  def failure
  end

  def destroy
    session[:user] = nil
    redirect_to '/login', notice: "Logged out!"
  end
end

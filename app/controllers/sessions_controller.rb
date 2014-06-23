class SessionsController < ApplicationController
  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']

    if session[:user]
      User.find(session[:user]).add_provider(auth_hash)
      render text: "Welcome back #{user.name}. You are signed in using #{auth_hash["provider"]}."
    else
      auth  = Authentication.find_or_create(auth_hash)

      session[:user] = auth.user
      render text: "Hello, #{user.name}. You are now signed up."
    end
  end

  def failure
  end

  def destroy
    redirect_to '/login'
  end
end

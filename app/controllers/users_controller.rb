class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user] = @user.id.to_s
      redirect_to login_path, notice: "You have signed up!"
    else
      render "new", notice: "There was a problem with creating your account"
    end
  end

  def show
  end

private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end

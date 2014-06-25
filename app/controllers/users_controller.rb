class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user] = @user.id.to_s
      redirect_to jobs_path, notice: t("session.new_user.email", user: @user.email)
    else
      render login_path, notice: t("session.failed_account_creation")
    end
  end

  def show
  end

private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end

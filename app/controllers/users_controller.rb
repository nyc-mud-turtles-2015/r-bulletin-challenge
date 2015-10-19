class UsersController < ApplicationController

  def register
    @user = User.new
  end

  def signup
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :register
    end
  end

  def login
    @user = User.new
  end

  def auth
    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])
      redirect_to root_path
    else
      @user.errors[:base] << "Wrong username / password combination."
      render :login
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end

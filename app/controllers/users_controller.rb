class UsersController < ApplicationController
  def show
    current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:error] = @user.errors.full_messages
      redirect_to register_path
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end

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

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end

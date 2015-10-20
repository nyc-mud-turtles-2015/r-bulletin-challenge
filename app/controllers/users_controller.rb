class UsersController < ApplicationController
  def show
    @user = User.find_by(id: session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user].permit(:username, :email, :password))
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:error] = @user.errors.full_messages
      redirect_to register_path
    end
  end
end

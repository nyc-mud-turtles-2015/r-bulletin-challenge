class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])
      login(@user)
      redirect_to root_path
    else
      @user.errors[:base] << "Incorrect username / password combination."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end

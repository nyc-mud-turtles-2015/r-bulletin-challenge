class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now.alert = 'Login failed'
      render :new
    end
  end

  def destroy
  end
end
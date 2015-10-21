class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      login(user)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path
  end


  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end

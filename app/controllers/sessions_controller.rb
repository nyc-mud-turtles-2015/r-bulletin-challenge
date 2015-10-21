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

  def create_with_oauth
    @user = User.find_or_create_from_auth_hash(auth_hash)
    @user.save
    session[:user_id] = @user.id
    redirect_to '/'
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end

class SessionsController < ApplicationController

  def new
  end

  def create
    if auth_hash.nil?
      user = User.find_by(username: params[:session][:username])
      if user && user.authenticate(params[:session][:password])
        login(user)
        redirect_to root_path
      else
        p 'auth failed'
        p params
        render 'new'
      end
    else
      user = User.find_or_create_from_auth_hash(auth_hash)
      login(user)
      redirect_to root_path
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

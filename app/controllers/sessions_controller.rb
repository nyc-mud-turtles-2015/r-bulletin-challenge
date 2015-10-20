class SessionsController < ApplicationController
  def login_form
    render '/users/login'
  end

  def login
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:error] = @user.errors.full_messages
      redirect_to login_path
    end
  end

  def logout
    session.destroy
    redirect_to categories_path
  end
end

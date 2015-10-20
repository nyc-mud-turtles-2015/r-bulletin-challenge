class UsersController < ApplicationController

  def index
  end

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
      flash[:error] = "Invalid username, email or password"
      render "new"
    end
  end

  def login_form
    render "/users/login"
  end

  def login
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:error] = "Invalid username, email or password"
      render "new"
    end
  end

  def logout
    session.destroy
    redirect_to categories_path
  end
end

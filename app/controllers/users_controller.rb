class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new()
    @user.assign_attributes(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to topics_url
      # redirect "/users/#{@user.id}"
    else
      # @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def login
    @user = User.new
  end

  def authenticate
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.password == params[:user][:password]
      session[:user_id] = @user.id
      redirect_to topics_url
      # redirect "/users/#{@user.id}"
    else
      # @errors = @user.errors.full_messages
      @user = User.new
      @user.errors.add(:username, ": didnt sign in, check the username and password fields again")
      render 'login'
    end
  end

  def logout
    session.clear
    redirect topics_url
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end

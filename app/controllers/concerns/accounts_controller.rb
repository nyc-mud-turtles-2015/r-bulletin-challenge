class AccountsController < ApplicationController
  def authenticate
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to :topics
    else
      @errors = ["Hey stupid, enter your information correctly!"]
      redirect_to :topics
    end
  end

  def login
    @user = User.new
  end

  def register
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to :back
    else
      @errors = @user.errors.full_messages
      redirect_to :back
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :salt, :encrypted_password)
  end
end

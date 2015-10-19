class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new()
    @user.assign_attributes(user_params)
    if @user.save
      redirect_to topics_url
      # redirect "/users/#{@user.id}"
    else
      # @errors = @user.errors.full_messages
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end

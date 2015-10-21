class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    if current_user && current_user.id == params[:id].to_i
      @latest_messages = current_user.messages.order(created_at: :desc).limit(5)
      @liked_messages = current_user.liked_messages
      @conversations = Conversation.where("user_id = ?", current_user)
      render :show
    else
      redirect_to login_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end

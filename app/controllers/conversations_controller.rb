class ConversationsController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def show
    @messages = Conversation.find(params[:id]).messages.order(created_at: :desc)
  end

end

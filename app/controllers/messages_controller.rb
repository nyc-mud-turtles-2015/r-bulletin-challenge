class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    conversation = Conversation.find_by(id: params[:conversation_id])
    @message = conversation.messages.build(content: params[:message][:content])

    # Note: user_id is not mass-assignable. Our app controls this, not the user.
    @message.user_id = session[:user_id]

    if @message.save
      redirect_to conversation_path(conversation)
    else
      render :new
    end
  end

  def message_params
    params.require(:message).permit(:content)
  end
end

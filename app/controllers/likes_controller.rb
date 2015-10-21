class LikesController < ApplicationController
  def create
    @message = Message.find_by(id: params[:message_id])

    like = Like.new
    like.vote = params[:vote]
    like.message_id = @message.id
    like.user_id = current_user.id

    like.save

    redirect_to conversation_path(@message.conversation)
  end
end

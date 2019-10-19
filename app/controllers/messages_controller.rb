class MessagesController < ApplicationController
  expose_decorated :chat
  expose_decorated :message, parent: :chat

  def create
    message.save

    redirect_to chat_path(chat)
  end

  private

  def message_params
    params.require(:message).permit(:text).merge(sender_id: current_user.id)
  end
end

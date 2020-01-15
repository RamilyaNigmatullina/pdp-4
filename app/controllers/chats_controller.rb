class ChatsController < BaseController
  expose_decorated :chat
  expose_decorated :messages, :fetch_messages
  expose_decorated :interlocutor, from: :chat, decorator: UserDecorator

  def show
  end

  def create
    if create_chat.success?
      respond_with(create_chat.chat)
    else
      redirect_to users_path
    end
  end

  private

  def authorize_resource!
    authorize! Chat
  end

  def create_chat
    @create_chat ||= CreateChat.call(current_user: current_user, chat_params: chat_params)
  end

  def chat_params
    params.require(:chat).permit(:user_id)
  end

  def fetch_messages
    chat.messages.order(created_at: :desc).page(1)
  end
end

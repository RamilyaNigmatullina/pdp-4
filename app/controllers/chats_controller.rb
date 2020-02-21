class ChatsController < BaseController
  expose :chat, :fetch_chat
  expose :chats, :fetch_chats

  def index
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

  def fetch_chat
    current_user.chats.first
  end

  def fetch_chats
    Chat.where(id: current_user.chats.ids).includes(first_user: :avatar_attachment, second_user: :avatar_attachment)
  end
end

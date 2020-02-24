class ChatsController < BaseController
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

  def fetch_chats
    Chat
      .left_outer_joins(:last_message)
      .where(id: current_user.chats.ids)
      .includes(first_user: :avatar_attachment, second_user: :avatar_attachment)
      .order("messages.created_at IS NULL, messages.created_at DESC")
      .uniq
  end
end

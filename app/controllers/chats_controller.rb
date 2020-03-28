class ChatsController < BaseController
  expose :chats, :fetch_chats

  def index
  end

  private

  def authorize_resource!
    authorize! Chat
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

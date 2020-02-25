class ChatSerializer < ApplicationSerializer
  attributes :id, :unread_messages_count

  has_one :interlocutor, serializer: UserSerializer
  has_one :last_message, serializer: MessageSerializer

  def last_message
    object.messages.order(:created_at).last
  end

  def unread_messages_count
    object.unread_messages_for(Current.user).count
  end
end

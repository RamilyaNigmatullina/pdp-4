class ChatSerializer < ApplicationSerializer
  attributes :id, :unread_messages_count

  has_one :interlocutor, serializer: UserSerializer
  has_one :last_message, serializer: MessageSerializer

  delegate :unread_messages, to: :object
  delegate :count, to: :unread_messages, prefix: true

  def last_message
    object.messages.order(:created_at).last
  end
end

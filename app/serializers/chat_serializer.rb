class ChatSerializer < ApplicationSerializer
  attributes :id

  has_one :interlocutor, serializer: UserSerializer
  has_one :last_message, serializer: MessageSerializer

  def last_message
    object.messages.order(:created_at).last
  end
end

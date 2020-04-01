class ChatSerializer < ApplicationSerializer
  attributes :id, :unread_messages_count

  has_one :interlocutor, serializer: UserSerializer
  has_one :last_message, serializer: MessageSerializer

  def unread_messages_count
    object.unread_messages_for(@instance_options[:user]).count
  end

  def interlocutor
    object.interlocutor(@instance_options[:user])
  end
end

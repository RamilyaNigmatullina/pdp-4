class ChatSerializer < ApplicationSerializer
  attributes :id

  has_one :interlocutor, serializer: UserSerializer
end

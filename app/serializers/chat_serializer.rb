class ChatSerializer < ApplicationSerializer
  attributes :id

  has_one :interlocutor
end

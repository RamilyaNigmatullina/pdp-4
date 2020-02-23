class ChatDecorator < ApplicationDecorator
  delegate :id

  decorates_association :messages
  decorates_association :interlocutor
end

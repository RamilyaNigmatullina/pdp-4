class ChatDecorator < ApplicationDecorator
  decorates_association :messages
  decorates_association :interlocutor
end

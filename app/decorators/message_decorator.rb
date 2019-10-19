class MessageDecorator < ApplicationDecorator
  decorates_association :chat
  decorates_association :sender
end

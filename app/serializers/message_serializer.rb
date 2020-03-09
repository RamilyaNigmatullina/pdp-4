class MessageSerializer < ApplicationSerializer
  attributes :id, :text, :sender_id, :created_at
end

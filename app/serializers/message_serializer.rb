class MessageSerializer < ApplicationSerializer
  attributes :id, :text, :sender_id, :created_at

  def created_at
    object.created_at.strftime("%b %d, %Y")
  end
end

class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :sender, class_name: "User"

  validates :text, presence: true
end

class Message < ApplicationRecord
  acts_as_paranoid

  belongs_to :chat
  belongs_to :sender, class_name: "User"

  validates :text, presence: true
end

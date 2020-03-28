class Chat < ApplicationRecord
  acts_as_paranoid

  belongs_to :first_user, class_name: "User"
  belongs_to :second_user, class_name: "User"

  has_many :messages, dependent: :destroy

  has_one :last_message, -> { order(id: :desc) }, class_name: "Message", inverse_of: :chat

  validates :second_user, interlocutor: true

  def interlocutor(user)
    first_user == user ? second_user : first_user
  end

  def unread_messages_for(user)
    messages.where(read_at: nil).where.not(sender: user)
  end
end

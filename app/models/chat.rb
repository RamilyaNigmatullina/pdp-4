class Chat < ApplicationRecord
  belongs_to :first_user, class_name: "User"
  belongs_to :second_user, class_name: "User"

  has_many :messages, dependent: :destroy

  has_one :last_message, -> { order(id: :desc) }, class_name: "Message"

  validates :second_user, interlocutor: true

  def interlocutor
    first_user == Current.user ? second_user : first_user
  end
end

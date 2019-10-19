class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable, :lockable

  has_many :first_user_chats, class_name: "Chat", foreign_key: :first_user_id,
            inverse_of: :first_user, dependent: :destroy
  has_many :second_user_chats, class_name: "Chat", foreign_key: :second_user_id,
            inverse_of: :second_user, dependent: :destroy

  has_one_attached :avatar

  validates :full_name, presence: true

  def chats
    first_user_chats.or(second_user_chats)
  end

  def chat_with(user:)
    Chat.where(first_user: self, second_user: user).or(Chat.where(first_user: user, second_user_id: self)).first
  end
end

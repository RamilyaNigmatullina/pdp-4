class User < ApplicationRecord
  extend Enumerize

  acts_as_paranoid

  devise :confirmable, :database_authenticatable, :invitable, :lockable, :recoverable,
    :registerable, :rememberable, :trackable, authentication_keys: %i[email company_id]

  belongs_to :company

  has_many :first_user_chats, class_name: "Chat", foreign_key: :first_user_id,
            inverse_of: :first_user, dependent: :destroy
  has_many :second_user_chats, class_name: "Chat", foreign_key: :second_user_id,
            inverse_of: :second_user, dependent: :destroy

  has_one_attached :avatar

  validates :email, presence: true, format: Devise.email_regexp,
    uniqueness: { scope: :company_id, case_sensitive: false }
  validates :full_name, presence: true
  validates :role, length: { maximum: 15 }
  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?
  validates :password, confirmation: :password_confirmation, if: :password_required?

  enumerize :role, in: %w[admin employee], predicates: true

  scope :active, -> { not_created_by_invite.or(invitation_accepted) }
  scope :not_created_by_invite, -> { where(invited_by_id: nil) }

  def self.find_for_authentication(warden_conditions)
    find_by(
      email: warden_conditions[:email].downcase,
      company_id: warden_conditions[:company_id]
    )
  end

  def chats
    first_user_chats.or(second_user_chats)
  end

  def chat_with(user:)
    Chat.where(first_user: self, second_user: user).or(Chat.where(first_user: user, second_user: self)).first
  end

  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end
end

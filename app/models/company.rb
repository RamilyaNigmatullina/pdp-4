class Company < ApplicationRecord
  has_many :users, dependent: :destroy

  has_one :admin, -> { where(role: "admin") }, class_name: "User", inverse_of: :company

  validates :admin, presence: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }, subdomain: true
  validates :name, presence: true, length: { maximum: 255 }

  accepts_nested_attributes_for :admin
end

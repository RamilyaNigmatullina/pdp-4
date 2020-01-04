class Company < ApplicationRecord
  has_many :users, dependent: :destroy

  has_one :admin, -> { where(role: "admin") }, class_name: "User", inverse_of: :company

  validates :admin, presence: true
  validates :slug, length: { maximum: 50 }, uniqueness: true
  validates :name, length: { maximum: 255 }

  accepts_nested_attributes_for :admin
end

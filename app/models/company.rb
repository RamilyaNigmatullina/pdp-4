class Company < ApplicationRecord
  has_many :users

  has_one :admin, -> { where(role: "admin") }, class_name: "User"

  validates :name, :slug, presence: true

  accepts_nested_attributes_for :admin
end

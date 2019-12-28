class Company < ApplicationRecord
  belongs_to :admin, class_name: "User"

  has_many :employees
  has_many :users, through: :employees

  validates :name, :slug, presence: true

  accepts_nested_attributes_for :admin
end

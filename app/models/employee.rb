class Employee < ApplicationRecord
  # AVAILABLE_ROLES = %w[user admin]

  belongs_to :user
  belongs_to :company

  enum role: { user: "user", admin: "admin" }
end

class UserPolicy < ApplicationPolicy
  def update?
    user.present?
  end
end

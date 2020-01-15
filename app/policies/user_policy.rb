class UserPolicy < ApplicationPolicy
  def index?
    true
  end

  def update?
    user.present?
  end
end

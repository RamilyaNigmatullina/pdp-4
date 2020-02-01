class UserPolicy < ApplicationPolicy
  def index?
    true
  end

  def update?
    true
  end
end

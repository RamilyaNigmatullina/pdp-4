class UserPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def create?
    user.admin?
  end

  def update?
    user == record
  end

  def destroy?
    user.admin?
  end
end

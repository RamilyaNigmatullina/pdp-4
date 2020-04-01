class CompanyPolicy < ApplicationPolicy
  def index?
    user.company == record
  end

  def update?
    user&.admin?
  end
end

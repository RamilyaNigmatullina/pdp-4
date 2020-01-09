class CompanyPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def update?
    user&.admin?
  end
end

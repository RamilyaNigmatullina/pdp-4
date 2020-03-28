module Users
  class RecoverPolicy < ApplicationPolicy
    def create?
      user.admin?
    end
  end
end

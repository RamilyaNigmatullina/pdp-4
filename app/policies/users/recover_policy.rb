module Users
  class ChatPolicy < ApplicationPolicy
    def create?
      user.admin?
    end
  end
end

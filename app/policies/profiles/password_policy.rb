module Profiles
  class PasswordPolicy < ApplicationPolicy
    def update?
      true
    end
  end
end

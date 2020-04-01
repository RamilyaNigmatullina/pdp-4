module Profiles
  class PasswordPolicy < ApplicationPolicy
    def update?
      user == record
    end
  end
end

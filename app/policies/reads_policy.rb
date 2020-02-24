class ReadsPolicy < ApplicationPolicy
  def create?
    user.chats.include?(chat)
  end
end

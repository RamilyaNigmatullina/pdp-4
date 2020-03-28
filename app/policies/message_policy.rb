class MessagePolicy < ApplicationPolicy
  def index?
    user.chats.include?(record.chat)
  end

  def create?
    user.chats.include?(record.chat)
  end
end

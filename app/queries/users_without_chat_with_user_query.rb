class UsersWithoutChatWithUserQuery
  def initialize(relation, user:)
    @relation = relation
    @user = user
  end

  def all
    relation.where.not(id: user_ids)
  end

  private

  attr_reader :relation, :user

  def user_ids
    user_ids = chats.map { |chat| chat.interlocutor(user).id }
    user_ids << user.id
  end

  def chats
    Chat.where(id: user.chats.ids)
  end
end

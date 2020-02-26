class FilteredUsers
  ALLOWED_PARAMS = %i[without_chat].freeze

  attr_reader :relation, :filter_params
  private :relation, :filter_params

  def initialize(relation, filter_params = {})
    @relation = relation
    @filter_params = filter_params
  end

  def all
    filter_params.slice(*ALLOWED_PARAMS).reduce(relation) do |relation, (key, value)|
      next relation if value.blank?

      send("by_#{key}", relation, value)
    end
  end

  private

  def by_without_chat(relation, without_chat)
    without_chat = ActiveModel::Type::Boolean.new.cast(without_chat)
    user_ids = Chat.where(id: Current.user.chats.ids).map { |chat| chat.interlocutor.id }

    without_chat ? relation.where.not(id: user_ids) : relation.where(id: user_ids)
  end
end

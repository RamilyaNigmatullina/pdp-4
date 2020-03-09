class FilteredMessagesQuery < BaseFilteredQuery
  ALLOWED_PARAMS = %i[created_at_until].freeze

  private

  def by_created_at_until(relation, created_at_until)
    relation.where("messages.created_at < ?", created_at_until)
  end
end

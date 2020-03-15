class FilteredUsersQuery < BaseFilteredQuery
  ALLOWED_PARAMS = %i[archived].freeze

  private

  def by_archived(relation, archived)
    archived = ActiveModel::Type::Boolean.new.cast(archived)

    archived ? relation.only_deleted : relation.without_deleted
  end
end

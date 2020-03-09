class BaseFilteredQuery
  ALLOWED_PARAMS = [].freeze

  def initialize(relation, filter_params = {}, options = {})
    @relation = relation
    @filter_params = filter_params
    @options = options
  end

  def all
    filter_params.slice(*self.class::ALLOWED_PARAMS).reduce(relation) do |relation, (key, value)|
      next relation if value.nil?

      send("by_#{key}", relation, value)
    end
  end

  private

  attr_reader :relation, :filter_params, :options
end

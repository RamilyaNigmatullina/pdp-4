class ApplicationDecorator < Draper::Decorator
  include Rails.application.routes.url_helpers

  delegate_all

  def self.collection_decorator_class
    PaginatingDecorator
  end
end

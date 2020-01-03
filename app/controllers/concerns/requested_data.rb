module RequestedData
  extend ActiveSupport::Concern

  included do
    def response_fields
      params[:fields] || []
    end
  end
end

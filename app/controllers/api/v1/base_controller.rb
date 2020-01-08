module Api
  module V1
    class BaseController < ActionController::Base
      include \
        Authentication,
        RequestedData

      protect_from_forgery with: :exception

      self.responder = ::ApiResponder
      respond_to :json

      helper_method :current_company

      def current_company
        @current_company ||= Company.find_by(slug: request.subdomain)
      end
    end
  end
end

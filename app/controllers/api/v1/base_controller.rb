module Api
  module V1
    class BaseController < ActionController::Base
      include \
        Authentication,
        RequestedData

      protect_from_forgery with: :exception

      before_action \
        :authorize_resource!,
        :authenticate_user!,
        :set_current

      self.responder = ::ApiResponder
      respond_to :json

      def set_current
        Current.user = current_user
      end
    end
  end
end

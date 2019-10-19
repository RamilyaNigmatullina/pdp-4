module Authentication
  extend ActiveSupport::Concern

  included do
    helper do
      def current_user
        super.decorate if user_signed_in?
      end
    end
  end
end

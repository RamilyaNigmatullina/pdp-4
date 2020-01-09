module Authentication
  extend ActiveSupport::Concern

  included do
    helper do
      def current_user
        super.decorate if user_signed_in?
      end

      def current_company
        controller.send(:current_company).decorate
      end
    end
  end

  def current_company
    @current_company ||= Company.find_by(slug: request.subdomain)
  end
end

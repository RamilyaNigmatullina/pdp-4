module Public
  module Users
    class SignInsController < BaseController
      expose_decorated :company, :fetch_company

      def show
      end

      def create
        if company
          redirect_to new_user_session_url(subdomain: company.slug)
        else
          flash[:error] = "Subdomain doesn't exist"

          redirect_to new_sign_in_path
        end
      end

      private

      def fetch_company
        Company.find_by(company_params)
      end

      def company_params
        params.require(:company).permit(:slug)
      end
    end
  end
end

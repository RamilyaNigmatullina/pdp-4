module Api
  module V1
    class CompaniesController < BaseController
      def update
        current_company.update(company_params)

        respond_with current_company
      end

      private

      def authorize_resource!
        authorize! current_company
      end

      def company_params
        params.require(:company).permit(:name, :slug)
      end
    end
  end
end

module CompanyRegistration
  class CreateCompany
    include Interactor

    delegate :company_params, to: :context

    def call
      company.assign_attributes(prepared_company_params)
    end

    private

    def prepared_company_params
      company_params.tap do |params|
        params[:admin_id] = user.id
        params.delete(:admin_attributes)
      end
    end
  end
end

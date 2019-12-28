module CompanyRegistration
  class CreateCompany
    include Interactor

    delegate :company_params, to: :context

    def call
      context.company = company

      context.fail!(error: error) if company.invalid?
    end

    private

    def company
      @company ||= Company.create(company_params)
    end

    def error
      company.errors.full_messages.join(", ")
    end
  end
end

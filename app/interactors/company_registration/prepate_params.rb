module CompanyRegistration
  class PrepareParams
    include Interactor

    delegate :company_params, :user, to: :context

    def call
      context.company_params = company_params.tap do |params|
        params.delete()
      end
    end
  end
end

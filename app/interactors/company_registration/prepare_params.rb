module CompanyRegistration
  class PrepareParams
    include Interactor

    delegate :company_params, to: :context

    def call
      context.user_params = user_params
    end

    private

    def user_params
      company_params
        .delete(:admin_attributes)
        .merge(role: "admin")
    end
  end
end

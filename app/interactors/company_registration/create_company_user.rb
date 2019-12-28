module CompanyRegistration
  class CreateCompanyUser
    include Interactor

    def call
      context.companies_user
    end
  end
end

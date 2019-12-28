module CompanyRegistration
  class Proceed
    include Interactor::Organizer

    organize \
      CompanyRegistration::PrepareParams,
      CompanyRegistration::CreateCompany,
      CompanyRegistration::CreateUser
  end
end

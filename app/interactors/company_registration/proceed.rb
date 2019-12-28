module CompanyRegistration
  class Proceed
    include Interactor::Organizer

    organize \
      CompanyRegistration::FindUser,
      CompanyRegistration::CreateUser,
      CompanyRegistration::CreateCompany
  end
end

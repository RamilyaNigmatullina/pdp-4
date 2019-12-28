module CompanyRegistration
  class FindUser
    include Interactor

    delegate :company_params, to: :context

    def call
      context.user = find_user
    end

    private

    def find_user
      User.find_by(email: email)
    end

    def email
      company_params[:admin_attributes][:email]
    end
  end
end

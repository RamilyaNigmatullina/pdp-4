module CompanyRegistration
  class CreateUser
    include Interactor

    delegate :company_params, :user, to: :context

    def call
      return if user

      context.user = create_user

      context.fail!(error: error) if user.invalid?
    end

    private

    def create_user
      User.create(company_params[:admin_attributes])
    end

    def error
      user.errors.full_messages.join(", ")
    end
  end
end

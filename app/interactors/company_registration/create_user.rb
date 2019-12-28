module CompanyRegistration
  class CreateUser
    include Interactor

    delegate :user_params, :company, to: :context

    def call
      context.fail!(error: error) if user.invalid?
    end

    private

    def user
      @user ||= company.users.create(user_params)
    end

    def error
      user.errors.full_messages.join(", ")
    end
  end
end

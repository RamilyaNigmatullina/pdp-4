shared_context :when_api_user_signed_in do
  let(:user) { create :user, :admin, :john_smith }
  let(:company) { user.company }

  before { login_as user }
end

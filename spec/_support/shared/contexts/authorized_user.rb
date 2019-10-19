shared_context :authorized_user do
  let(:user) { create :user }

  before { sign_in(user) }
end

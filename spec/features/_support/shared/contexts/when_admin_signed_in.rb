shared_context :when_admin_signed_in do
  let(:user) { create :user, :admin, :john_smith }
  let(:company) { user.company }

  before do
    switch_to_subdomain(company.slug)

    login_as user
  end

  after do
    switch_to_subdomain(nil)
  end
end

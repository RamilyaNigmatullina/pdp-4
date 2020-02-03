require "feature_spec_helper"

feature "Accept invitation", :js do
  let(:admin) { create :user, :admin, :john_smith }
  let(:user) do
    create :user, company: company, email: "kevin.doe@flatstack.com", full_name: "Kevin Doe",
      invited_by: admin, invitation_created_at: Time.zone.now
  end
  let(:company) { admin.company }

  before do
    switch_to_subdomain(company.slug)

    allow(User).to receive(:find_by_invitation_token).with("invitation_token", any_args) { user }
  end

  after { switch_to_subdomain(nil) }

  scenario "User accepts invitation" do
    visit accept_user_invitation_path(invitation_token: "invitation_token")

    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_on "Set my password"

    expect(page).to have_content("Your password was set successfully. You are now signed in.")
    expect(page).to have_content("Kevin Doe")
  end
end

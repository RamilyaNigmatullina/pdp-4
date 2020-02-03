require "feature_spec_helper"

feature "Invite user", :js do
  include_context :when_admin_signed_in

  scenario "Admin invites user" do
    visit users_path

    click_on "Invite user"

    fill_in "Full name", with: "Kevin Doe"
    fill_in "Email", with: "kevin.doe@flatstack.com"

    click_on "Send an invitation"

    expect(page).to have_content("An invitation email has been sent to kevin.doe@flatstack.com.")

    open_email("kevin.doe@flatstack.com")

    expect(current_email).to have_subject("Invitation instructions")
  end
end

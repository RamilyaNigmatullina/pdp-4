require "feature_spec_helper"

feature "Archive user" do
  include_context :when_admin_signed_in

  before { create :user, :kevin_doe, company: company }

  scenario "Admin archives user" do
    visit users_path

    expect(page).to have_content("Kevin Doe")

    click_on "Archive"

    expect(page).to have_content("User was successfully archived.")
    expect(page).not_to have_content("Kevin Doe")

    click_on "Archived"

    expect(page).to have_content("Kevin Doe")
  end
end

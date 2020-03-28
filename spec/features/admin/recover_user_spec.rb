require "feature_spec_helper"

feature "Recover user" do
  include_context :when_admin_signed_in

  before { create :user, :kevin_doe, :archived, company: company }

  scenario "Admin recovers user" do
    visit users_path(archived: true)

    expect(page).to have_content("Kevin Doe")

    click_on "Reactivate"

    expect(page).to have_content("User was successfully reactivated.")
    expect(page).to have_content("Kevin Doe")

    click_on "Archived"

    expect(page).not_to have_content("Kevin Doe")
  end
end

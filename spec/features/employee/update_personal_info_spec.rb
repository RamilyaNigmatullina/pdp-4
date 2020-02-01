require "feature_spec_helper"

feature "Update user", :js do
  include_context :when_employee_signed_in

  let(:menu_toggle_selector) { "#menu-toggle" }

  scenario "User updates personal info" do
    visit edit_profile_path

    fill_in "Full name", with: "Kevin Doe"

    find(menu_toggle_selector).click

    click_on "Profile settings"

    expect(page).to have_content("Kevin Doe")
  end
end

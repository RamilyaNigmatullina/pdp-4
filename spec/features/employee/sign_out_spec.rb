require "feature_spec_helper"

feature "Sign out" do
  include_context :when_employee_signed_in

  scenario "User signs out" do
    visit company_root_path

    click_on "Sign Out"

    expect(page).to have_content("Sign in to Flatstack")
  end
end

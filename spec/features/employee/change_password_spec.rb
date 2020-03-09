require "feature_spec_helper"

feature "Update user password" do
  include_context :when_employee_signed_in

  scenario "User updates password" do
    visit edit_profiles_passwords_path

    within ".user_password" do
      fill_in "Password", with: "123456"
    end
    fill_in "Password confirmation", with: "123456"
    fill_in "Current password", with: "password"

    click_on "Update"

    expect(page).to have_content("Password was successfully changed!")
  end
end

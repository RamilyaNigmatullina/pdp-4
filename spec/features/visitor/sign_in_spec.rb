require "feature_spec_helper"

feature "Sign in", :js do
  before { create :user, :john_smith }

  scenario "User signs in" do
    visit users_sign_in_path

    fill_in "Slug", with: "fs"

    click_on "Continue"

    expect(page).to have_content("Sign in to Flatstack")

    fill_in "Email", with: "john.smith@example.com"
    fill_in "Password", with: "password"

    click_on "Log in"

    expect(page).to have_content("Flatstack company")
  end
end

require "feature_spec_helper"

feature "Create Company", :js do
  scenario "User creates company" do
    visit new_company_path

    fill_in "Name", with: "Flatstack"
    fill_in "Slug", with: "fs"

    click_button "Next step"

    fill_in "Full name", with: "John Smith"
    fill_in "Email", with: "john.smith@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_button "Sign up"

    expect(current_url).to eq(company_root_url("fs"))
    expect(page).to have_content("Sign in to Flatstack")
  end

  def company_root_url(subdomain)
    Rails.application.routes.url_helpers.new_user_session_url(subdomain: subdomain, port: ENV["PORT"])
  end
end

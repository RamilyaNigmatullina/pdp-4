require "feature_spec_helper"

feature "Create Company", :js do
  let(:created_user) { User.last }
  let(:confirmation_token) { created_user.confirmation_token }
  let(:confirm_email_link) { "http://fs.lvh.me/users/confirmation?confirmation_token=#{confirmation_token}" }

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

    open_email("john.smith@example.com")

    expect(current_email).to have_subject("Confirmation instructions")
    expect(current_email).to have_link("Confirm my account", href: confirm_email_link)
  end

  def company_root_url(subdomain)
    Rails.application.routes.url_helpers.new_user_session_url(subdomain: subdomain, port: ENV["PORT"])
  end
end

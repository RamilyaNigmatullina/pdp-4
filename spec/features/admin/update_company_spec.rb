require "feature_spec_helper"

feature "Update user", :js do
  include_context :when_admin_signed_in

  let(:menu_toggle_selector) { "#menu-toggle" }

  scenario "User updates company" do
    visit edit_company_path

    fill_in "Name", with: "OOO 'Эф-Эс'"

    find(menu_toggle_selector).click

    click_on "Flatstack"

    expect(page).to have_content("OOO 'Эф-Эс' company")
  end
end

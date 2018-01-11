require "rails_helper"

feature "User Log In" do
  scenario "with correct credentials" do
    User.create(email: 'example@example.com', password: 'password', admin: true)
    visit admin_login_path
    expect(page).to have_text "Log In"
    fill_in "email", with: 'example@example.com'
    fill_in "password", with: 'password'
    click_button "Log in"
    expect(page).to have_text "Welcome to Stayloud LA!"
  end
end

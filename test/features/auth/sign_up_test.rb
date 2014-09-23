require "helpers/test_helper"

feature "I want to sign up for an account" do
  scenario "sign up" do
    visit new_user_session_path
    click_on "Sign up"

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    click_on "Sign up"

    page.wont_have_content "There was a problem with your sign up"
  end
end

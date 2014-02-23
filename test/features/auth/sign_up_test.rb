require "test_helper"

feature "I want to sign up for an account" do
  scenario "sign up" do
    visit root_path

    click_on "Sign Up"

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"

    page.must_have_content "success"
    page.wont_have_content "There was a problem with your sign up"
  end
end

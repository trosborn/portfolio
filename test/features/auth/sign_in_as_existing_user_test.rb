require "test_helper"

feature "Auth::SignInAsExistingUser" do
  scenario "I login as an existing user" do
    visit root_path

    click_on "Login"
    fill_in "Email", with: "email@example.com"
    fill_in "Password", with: "password"

    click_on "Sign in"

    page.must_have_content "success"

  end
end

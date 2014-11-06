require "helpers/test_helper"

feature "Account access" do
  scenario "I login as an existing user" do
    visit root_path

    click_on "Sign In"
    fill_in "Email", with: "email@example.com"
    fill_in "Password", with: "password"

    click_on "Sign in"

    page.must_have_content "success"

  end
  scenario "I want to sign out" do

    sign_in
    click_on "Sign Out"
    page.must_have_content "success"
  end
  scenario "I want to create a new account" do
    visit new_user_session_path
    click_on "Sign up"

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"

    page.wont_have_content "error"
    page.must_have_content "success"
  end
  scenario "sign in with twitter works" do
    visit root_path
    click_on "Sign In"
    OmniAuth.config.test_mode = true
    Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
    OmniAuth.config.add_mock(:twitter,
                          {
                          uid: '12345',
                          })
    click_on "Sign in with Twitter"

    page.must_have_content "Sign Out"
  end
end

require "test_helper"

feature "I want to end my session and logout" do
  scenario "I want to log out" do

    sign_in
    click_on "Sign out"
    page.must_have_content "success"
  end
end

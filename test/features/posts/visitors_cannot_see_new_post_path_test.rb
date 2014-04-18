require "test_helper"

feature "visitors cannot see new post path" do
  scenario "as an unauthenticated visitor, I cannot access new_post_path" do
    visit new_post_path
    page.must_have_content "You need to sign in or sign up before continuing"
  end
end

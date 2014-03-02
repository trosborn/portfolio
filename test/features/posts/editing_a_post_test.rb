require "test_helper"

feature "Editing a post" do
  scenario "submit updates to an existing post" do

    visit new_user_session_path
    fill_in "Email", with: users(:thomas).email
    fill_in "Password", with: "password"
    click_on "Sign in"

    test_post = posts(:poopin)
    visit post_path(test_post)

    click_on "Edit"
    fill_in "Title", with: "Becoming a Web Developer"
    click_on "Update Post"

    page.text.must_include "Post was successfully updated"
    page.text.must_include "Web Developer"
  end
end

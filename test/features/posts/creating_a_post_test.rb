require "test_helper"

feature "Creating a post" do
  scenario "submit form data to create a new post" do

    test_post = posts(:poopin)
    visit new_user_session_path

    fill_in "Email", with: "email@example.com"
    fill_in "Password", with: "password"
    click_on "Sign in"

    visit new_post_path
    fill_in "Title", with: test_post.title
    fill_in "Body", with: test_post.body

    click_on "Create Post"

    page.text.must_include "Post was successfully created"
    page.text.must_include "poopin"

    page.has_css? "#author"
    page.text.must_include users(:thomas).email
  end
end

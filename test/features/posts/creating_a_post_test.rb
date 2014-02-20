require "test_helper"

feature "Creating a post" do
  scenario "submit form data to create a new post" do
    visit new_post_path
    fill_in "Title", with: "Code Rails"
    fill_in "Body", with: "This is how I learned to make a rails apps."

    click_on "Create Post"

    page.text.must_include "Post was successfully created"
    page.text.must_include "how I learned to make a rails apps"
  end
end

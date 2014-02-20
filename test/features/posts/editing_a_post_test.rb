require "test_helper"

feature "Editing a post" do
  scenario "submit updates to an existing post" do
    post = Post.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")
    visit post_path(post)

    click_on "Edit"
    fill_in "Title", with: "Becoming a Web Developer"
    click_on "Update Post"

    page.text.must_include "Post was successfully updated"
    page.text.must_include "Web Developer"
  end
end

require "test_helper"

feature "creating a comment" do
  scenario "as a random Twitter user, I want to post a comment to Thomas' blog" do

    post = posts(:poopin)
    visit post_path(post)

    fill_in "Content", with: "yolo"

    click_on "Create Comment"

    page.text.must_include "yolo"

  end
end

require "test_helper"

feature "As a post author" do

  before do
    @author = users(:author)
    @not_author = users(:thomas)

    sign_in(:author)
  end

  scenario "I see only my own posts" do
    visit posts_path

    page.must_have_content "yolo"
    page.wont_have_content "poopin"
  end

  scenario "I want to create posts" do

    visit new_post_path
    fill_in "Title", with: "test post"
    fill_in "Body", with: "auth test post"

    click_on "Create Post"

    page.text.must_include "Post was successfully created"
    page.text.must_include "test post"
  end

  scenario "I want to edit posts" do
    test_post = posts(:author_test)

    visit post_path(test_post)

    click_on "Edit"
    fill_in "Title", with: "Becoming a fiend"
    click_on "Update Post"

    page.text.must_include "Post was successfully updated"
    page.text.must_include "fiend"
  end

  scenario "I should not be able to delete posts (because editor gets to" do
    post = @author.posts.first
    visit post_path(post)

    page.wont_have_content "Delete"
  end
end

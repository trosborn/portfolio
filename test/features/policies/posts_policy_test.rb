require "test_helper"

feature "Pundit limits post privileges to admin" do
  scenario "admin can create posts" do
    sign_in(:admin)

    visit new_post_path
    test_post = posts(:poopin)

    fill_in "Title", with: test_post.title
    fill_in "Body", with: test_post.body
    click_on "Create Post"

    page.text.must_include "poopin"

  end

  scenario "post is deleted with a click" do

    sign_in(:admin)
    visit posts_path

    test_post = posts(:poopin)
    visit post_path(test_post)
    click_link( 'Destroy', :match => :first)
    page.wont_have_content "poopin"
  end

  scenario "submit updates to an existing post" do

    sign_in(:admin)
    visit posts_path

    test_post = posts(:poopin)
    visit post_path(test_post)

    click_on "Edit"
    fill_in "Title", with: "Becoming a Web Developer"
    click_on "Update Post"

    page.text.must_include "Post was successfully updated"
    page.text.must_include "Web Developer"
  end
end

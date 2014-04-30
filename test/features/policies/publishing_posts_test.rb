require "test_helper"

feature "Policies::PublishingPosts" do
  scenario "authors can't publish" do

    sign_in(:author)
    visit new_post_path
    page.wont_have_field('Published')
  end

  scenario "editors can publish" do
    sign_in(:editor)
    visit new_post_path

    page.must_have_field('Published')

    fill_in "Title", with: posts(:poopin).title
    fill_in "Body", with: posts(:poopin).body
    check "Published"
    click_on "Create Post"

    page.text.must_include "Status: Published"
  end
end

require "test_helper"

feature "visitors can read posts" do
  scenario "visitors can see the post index" do
    visit posts_path

    page.must_have_content "poopin'"
  end
  scenario "visitors can see the post show page" do
    visit posts_path
    click_link('Show', :match => :first )
    page.must_have_content "poopin'"
  end
end
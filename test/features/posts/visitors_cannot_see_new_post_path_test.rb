require "test_helper"

feature "new post button is hidden from visitors" do
  scenario "as an unauthenticted visitor, I cannot see new post button" do
    visit posts_path
    page.wont_have_link "New Post"
  end
  scenario "as an unauthenicated visitor, I cannot access the new posts path" do
    visit new_post_path

    page.must_have_content "Sign in"
  end
end

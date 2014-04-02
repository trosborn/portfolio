require "test_helper"

feature "Can login with Twitter" do
  scenario "the user is logged in with their Twitter account" do
    visit root_path
    page.must_have_content "Hello World"
    page.wont_have_content "Goobye All!"
  end
end

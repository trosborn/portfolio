require "test_helper"

feature "can access home" do
  scenario "the test is sound" do
    visit root_path
    page.must_have_content "Thomas"
    page.wont_have_content "Goobye All!"
  end
end

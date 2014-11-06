require "helpers/test_helper"

feature "can access home" do
  scenario "the test is sound" do
    visit root_path
    page.must_have_content "Thomas"
  end
end

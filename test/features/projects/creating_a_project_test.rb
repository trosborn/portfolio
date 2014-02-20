require "test_helper"

feature "Projects::CreatingAProject" do
  scenario "the test is sound" do
    visit projects_path
    click_on "New Project"
    fill_in "Name", with: "UW Portfolio"
    fill_in "Technologies used", with: "Rails"
    click_on "Create Project"
    page.text.must_include "Project has been created"
    page.text.must_include "UW Portfolio"
    page.text.must_include "Rails"
  end
end

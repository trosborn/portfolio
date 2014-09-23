require "test_helper"

feature "new project button is hidden from visitors" do
  scenario "as an unauthenticted visitor, I cannot see new project button" do
    visit projects_path
    page.wont_have_link "New Project"
  end
  scenario "as an unauthenicated visitor, I cannot access the new posts path" do
    visit new_project_path

    page.must_have_content "Sign in"
  end
end

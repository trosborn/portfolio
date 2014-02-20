require "test_helper"

feature "Projects::EditingAProject" do
  scenario "editing a project" do
    visit edit_project_path(projects(:portfolio))

    fill_in "Name", with: "new name"
    click_on "Update Project"

    page.text.must_include "success"
    page.text.must_include "new name"
    page.text.wont_include "Code Fellows Portfolio"
  end
end

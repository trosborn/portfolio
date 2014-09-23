require "helpers/test_helper"

feature "Pundit limits projects privileges to admin" do
  scenario "admin can create projects" do
    sign_in(:admin)

    visit new_project_path
    test_project = projects(:portfolio)

    fill_in "Name", with: test_project.name
    fill_in "Technologies used", with: test_project.technologies_used
    click_on "Create Project"

    page.text.must_include "meta"

  end

  scenario "post is deleted with a click" do

    sign_in(:admin)
    visit projects_path

    test_project = projects(:portfolio)
    visit project_path(test_project)
    click_link('Destroy')
    page.wont_have_content "meta"
  end

  scenario "submit updates to an existing post" do

    sign_in(:admin)
    visit projects_path

    test_project = projects(:portfolio)
    visit project_path(test_project)

    click_on "Edit"
    fill_in "Name", with: "Aminoize"
    click_on "Update Project"

    page.text.must_include "Project was successfully updated"
    page.text.must_include "Aminoize"
  end
end

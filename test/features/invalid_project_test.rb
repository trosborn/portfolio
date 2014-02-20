require "test_helper"

feature "InvalidProject" do
  scenario "the test is sound" do
    # Given invalid input

    visit new_project_path
    fill_in "Name", with: "q"

    #When the form is submitted with a short name and missing technologies fiel

    click_on "Create Project"
    # Then the form should display an error message

    current_path.must_match /projects$/
    page.text.must_include "Project could not be saved"
    page.text.must_include "Name is too short"
    page.text.must_include "Technologies used can't be blank"
  end
end

require "test_helper"

feature "Deleting a project" do
  scenario "the project is deleted" do

    visit project_path(projects(:freelance))

    click_on "Destroy"
    page.wont_have_content "Automilker"
  end
end

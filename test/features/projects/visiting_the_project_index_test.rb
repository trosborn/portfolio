require "test_helper"

feature "as a developer I want to show all my posts in one page" do
  scenario "with existing projects" do

    visit projects_path
    page.text.must_include "Barnyard Cereal"
    page.text.must_include "Ruby, Rails"
  end
end

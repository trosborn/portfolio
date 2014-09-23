require "helpers/test_helper"

feature "Check for Zurb" do
  scenario "have Zurb running as front end framework" do
    visit root_path
    page.body.must_include "columns"
  end
end

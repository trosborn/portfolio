require "test_helper"

feature "WelcomePage" do
  scenario "the site is deployed" do
    visit mysitename.com
    page.must_have_content "Hello World"
    page.wont_have_content "Goobye All!"
  end
end

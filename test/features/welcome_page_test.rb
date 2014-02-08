require "test_helper"

feature "WelcomePage" do
  scenario "the site is deployed" do
    visit "http://obscure-crag-6658.herokuapp.com/"
    page.must_have_content "Thomas Osborn"
    page.wont_have_content "Goobye All!"
  end
end

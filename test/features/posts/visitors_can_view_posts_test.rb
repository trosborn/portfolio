require "helpers/test_helper"

feature "visitors can read posts" do
  scenario "visitors can see the post index" do
    visit posts_path

    page.must_have_content "Aminoize"
  end
  scenario "visitors can see the post show page" do
    visit posts_path
    click_link('Aminoize', :match => :first )

    page.must_have_content "Aminoize is the best site"
  end
end

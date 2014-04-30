require "test_helper"

feature "Deleting a post" do
  scenario "post is deleted with a click" do

    sign_in(:editor)
    visit posts_path

    click_link( 'Destroy', :match => :first)
    page.wont_have_content "poopin"
  end
end

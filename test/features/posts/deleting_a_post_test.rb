require "test_helper"

feature "Deleting a post" do
  scenario "post is deleted with a click" do
#    Post.create(title: "Becoming a Code Fellow", body: "Means striving for excellence")
    visit posts_path

    click_on "Destroy"
    page.wont_have_content "poopin"
  end
end

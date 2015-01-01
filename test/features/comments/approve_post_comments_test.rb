require "helpers/test_helper"

feature "Comment approval" do
  before do
    sign_in
    visit post_path(posts(:aminoize))
    fill_in :comment_author, with: "Mark Twain"
    fill_in :comment_author_url, with: "marktwain.com"
    fill_in :comment_author_email, with: "mark@twain.com"
    fill_in :comment_content, with: "To succeed in life, you need two things: ignorance and confidence."
    click_on "Submit comment"
  end

  scenario "comments do not display while unapproved" do
    visit post_path(posts(:aminoize))

    page.wont_have_content "To succeed in life"
  end

  scenario "comments are displayed after approval" do
  end
end

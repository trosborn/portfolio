require "test_helper"

=begin
feature "I want to approve comments" do
  before do
    visit post_path(posts(:approve_comment))
    fill_in :comment_author, with: "Mark Twain"
    fill_in :comment_author_url, with: "marktwain.com"
    fill_in :comment_author_email, with: "mark@twain.com"
    fill_in :comment_content, with: "To succeed in life, you need two things: ignorance and confidence."
    click_on  "Submit comment"
  end

  scenario "comments do not display whilst unapproved" do
    visit post_path(posts(:approve_comment))
    page.wont_have_content "To succeed in life"
  end

  scenario "approve comments" do
    sign_in(:editor)
    visit post_comments_path(posts(:approve_comment))
    click_on "Approve"
    page.must_have_content "To succeed in life"
  end
end
=end

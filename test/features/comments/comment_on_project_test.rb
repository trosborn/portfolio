require "test_helper"

feature "commenting on a portfolio project" do
  scenario "I want to comment on a portfolio project" do
    visit projects_path
    click_on "New Project"
    fill_in "Name", with: "UW Portfolio"
    fill_in "Technologies used", with: "Rails"
    click_on "Create Project"

    fill_in :comment_author, with: "Mark Twain"
    fill_in :comment_author_url, with: "marktwain.com"
    fill_in :comment_author_email, with: "mark@twain.com"
    fill_in :comment_content, with: "To succeed in life, you need two things: ignorance and confidence."
    click_on  "Submit comment"
  end

  scenario "approve comments" do
#    sign_in(:editor)
#    visit project_comments_path(projects(:portfolio))
#    click_on "Approve"
#    page.must_have_content "To succeed in life"
  end
end

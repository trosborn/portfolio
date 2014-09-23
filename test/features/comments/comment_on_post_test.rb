require "test_helper"

feature "Commenting on a portfolio project" do
  scenario "unverified users are prompted to sign in to comment" do
    visit post_path(posts(:aminoize))

    page.must_have_content "You must sign in to comment"
  end
  scenario "unverified users cannot see the new comment form" do
    page.wont_have_field "Comment"
  end
end

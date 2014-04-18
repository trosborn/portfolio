require "test_helper"

feature "Comments::ApproveComments" do
  scenario "the test is sound" do
    sign_in

    post = posts(:poopin)
    visit post_path(post)
    page.must_have_content 'unapproved comments'

    click_on 'Approve comment'

    page.must_have_content 'approved'

    visit post_comments_path(post)
    page.must_have_content 'Approved'
  end
end

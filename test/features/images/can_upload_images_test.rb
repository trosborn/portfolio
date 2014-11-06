require "helpers/test_helper"

feature "Can CRUD images" do
  scenario "can upload a new image" do
    visit posts_path
    click_link('Show', :match => :first )
    click_link('Edit Attachment', :match => :first)
  end
end

require "helpers/test_helper"

feature "Can CRUD images" do
  scenario "can edit images from post path" do
    visit posts_path
    click_link('Show', :match => :first )
    click_link('Edit Attachment', :match => :first)
  end
end

require "helpers/test_helper"

feature "Can CRUD images" do
  scenario "can upload a new image" do
    visit images_path
    click_link('Add image')

  end
end

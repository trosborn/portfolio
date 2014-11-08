require "helpers/test_helper"

feature "image CRUD" do
  scenario "can upload a new image" do
    visit images_path
    attach_file_for_direct_upload("fixtures/palestinian_resistance_wall.jpg}")
    click_button "Upload Image"
  end
end

require "helpers/test_helper"

feature "image CRUD" do
  scenario "admin can upload a new image" do
    sign_in(:admin)
    image = Image.create!(body: fixture_file_upload('files/palestinian_resistance_wall.jpg', 'image/jpg'))
    assert(File.exists?(image.reload.body.file.path))
  end
  scenario "Joe Schmoe cannot upload a new image"

  end
end

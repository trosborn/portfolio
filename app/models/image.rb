class Image < ActiveRecord::Base
  mount_uploader :body, ImageUploader
end

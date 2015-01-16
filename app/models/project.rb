class Project < ActiveRecord::Base
  validates_presence_of :technologies_used
  validates :name, length: { in: 4..255 }

  mount_uploader :image, ImageUploader

  has_many :comments, as: :commentable
end

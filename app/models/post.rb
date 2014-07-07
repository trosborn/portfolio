class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"

  has_many :comments, as: :commentable

  scope :published, -> { where(published: true) }

  mount_uploader :image, ImageUploader

  def self.create_from_postmark mitt
    api_token = mitt.from #.split("@").first.split("+").last
    user = User.find_by_email(api_token)
    if user
      post = user.posts.new
      post.title = mitt.subject
      post.body = if mitt.text_body.blank?
        mitt.html_body
      else
        mitt.text_body
      end
      post.save
    else
      return false
    end
  end
end

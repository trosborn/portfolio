class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"

  has_many :comments, as: :commentable

  scope :published, -> { where(published: true) }

  def self.create_from_postmark(mitt)
    api_token = mitt.to.split("@").first.split("+").last
    user = User.find_by_api_token(api_token)
    if user
      post = user.posts.new
      post.message_id = mitt.message_id
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

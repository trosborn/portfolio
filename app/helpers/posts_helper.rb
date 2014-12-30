module PostsHelper
  def preview post
    post.body.split('.').first
  end
end

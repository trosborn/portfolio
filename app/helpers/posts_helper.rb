module PostsHelper
  def preview post
    @post = post
    post.body.split('.').first
  end
end

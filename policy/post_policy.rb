class PostPolicy
  attr_accessor :user, :post

  def initialize user, post
    @user = user
    @post = post
  end

  def publish?
    @user.role == "editor"
  end
end

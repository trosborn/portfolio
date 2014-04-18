class PostPolicy < ApplicationPolicy
  attr_accessor :user, :post

  Scope = Struct.new(:user, :scope) do
    def resolve
      if user
        if user.author?
          return scope.where(author_id: user.id)
        elsif user.editor?
          scope.all
        end
      end
      scope.where(published: true)
    end
  end

  def initialize user, post
    @user = user || NullUser.new
    @post = post
  end

  def publish?
    @user.editor?
  end

  def create?
    @user.author? || @user.editor?
  end

  def update?
    @post.author == @user || @user.editor?
  end

  def destroy?
    @user.editor?
  end
end

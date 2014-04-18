class PostPolicy < ApplicationPolicy
  attr_accessor :user, :post

  Scope = Struct.new(:user, :scope) do
    def resolve
      if user.present? && user.editor?
        scope.all?
      elsif user.present? && user.author?
        scope.where(author_id: user.id) | scope.published
      else
        scope.where(published :true)
      end
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
    user.author?
  end

  def update?
    @post.author == @user
  end

  def destroy?
    @user.editor?
  end
end

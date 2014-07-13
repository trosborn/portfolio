class PostPolicy < ApplicationPolicy
  attr_accessor :user, :post

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.editor?
        scope.all
      elsif user.author?
        scope.where(author_id: user.id) | scope.where(published: true)
      else
        scope.where(published: true)
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
    @user.author? || @user.editor?
  end

  def update?
    @post.author == @user || @user.editor?
  end

  def destroy?
    @user.editor?
  end
end

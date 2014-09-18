class PostPolicy < ApplicationPolicy
  attr_accessor :user, :post

  def initialize user, post
    @user = user || NullUser.new
    @post = post
  end

  def create?
    @user.admin?
  end

  def update?
    @user.admin?
  end

  def destroy?
    @user.admin?
  end

  def publish?
    @user.admin?
  end
end

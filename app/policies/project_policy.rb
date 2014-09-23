class ProjectPolicy < ApplicationPolicy
  attr_accessor :user, :project

  def initialize user, project
    @user = user || NullUser.new
    @project = project
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

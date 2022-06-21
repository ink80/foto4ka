class PostPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    true
  end

  def create?
    user.present?
  end

  def update?
    return true if user.present? && user == post.user || user.role == 'admin'
  end

  def destroy?
    return true if user.present? && user == post.user || user.role == 'admin'
  end

  private

  def post
    record
  end
end

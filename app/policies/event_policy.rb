class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(organization: user.organization)
    end
  end

  def create?
    User.roles.keys.first(2).include?(user.role)
  end

  def show?
    true
  end

  def edit?
    true
  end

  def update?
    true
  end

  def index?
    true
  end
end

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
    record.organization == user.organization
  end

  def edit?
    record.organization == user.organization
  end

  def update?
    record.organization == user.organization
  end

  def index?
    record.organization == user.organization
  end
end

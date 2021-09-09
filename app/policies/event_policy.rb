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
    owner_or_admin?
  end

  def edit?
    owner_or_admin?
  end

  def update?
    owner_or_admin?
  end

  def index?
    owner_or_admin?
  end

  private

  def owner_or_admin?
    user.organization == record.organization
  end
end

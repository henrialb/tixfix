class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(organization: user.organization)
    end
  end

  def create?
    admin_or_manager
  end

  def update?
    admin_or_manager && record.organization == user.organization
  end

  def show?
    owner_or_admin? && record.organization == user.organization
  end

  private

  def owner_or_admin?
    user.organization == record.organization
  end
end

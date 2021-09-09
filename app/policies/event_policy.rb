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
    admin_or_manager
  end

  private

  def admin_or_manager
    User.roles.keys.first(2).include?(user.role)
  end
end

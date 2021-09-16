class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(organization: user.organization)
    end
  end

  def show?
    admin_or_manager && record.event.organization == user.organization
  end

  def create?
    true
  end

  def print_all?
    show?
  end
end

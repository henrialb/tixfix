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

# def admin_or_manager
#  User.roles.keys.first(2).include?(user.role)
# end

  def show?
    owner_or_admin?
  end

  def edit?
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

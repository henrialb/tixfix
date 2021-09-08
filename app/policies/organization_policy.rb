class OrganizationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    true
  end

  def destroy?
    owner_or_admin?
  end

  private

  def owner_or_admin?
    user == record.user
  end
end

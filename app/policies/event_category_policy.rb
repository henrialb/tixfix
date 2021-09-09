class EventCategoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
  end

  def destroy?
    admin_or_manager
  end
end

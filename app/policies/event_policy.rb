class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(organization: user.organization)
    end
  end
end

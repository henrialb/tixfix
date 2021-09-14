class TicketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(organization: user.organization)
    end
  end

  def show?
    record.event_category.event.organization == user.organization
  end
end

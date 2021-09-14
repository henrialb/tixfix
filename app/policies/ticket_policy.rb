class TicketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(organization: user.organization)
    end
  end

  def print?
    record.event_category.event.organization == user.organization
  end
end

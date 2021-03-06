class TicketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.event_category.event.organization == user.organization
  end

  def validation?
    admin_or_manager
  end
end

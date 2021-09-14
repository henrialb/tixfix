class TicketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index
    admin_or_manager
  end

  def validation?
    admin_or_manager
  end
end

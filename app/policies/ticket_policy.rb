class TicketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def index
      admin_or_manager
    end
  end
end

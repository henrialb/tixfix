class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index
    admin_or_manager
  end

  def show
    admin_or_manager
  end
end

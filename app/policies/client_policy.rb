class ClientPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  private

  def owner?
    record.order.event.organization == user.organization
  end
end

class ClientPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    false
  end

  def create?
    false
  end

  def show?
    true
  end

  def edit?
    owner_or_admin?
  end

  def update?
    owner_or_admin?
  end

  def index?
    true
  end

  def destroy?
    owner_or_admin
  end

  private

  def owner_or_admin?
    user.client == record
  end
end

class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    false
  end

  def edit?
    update?
  end

  def update?
    record.user == user || user.admin?
  end
end

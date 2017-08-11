class KpiPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.present?
          scope.all
      end
    end
  end

  def index?
    return true if user.present? && (rol == "admin" || rol == "admin_ind" || rol == "cli_ind")
  end

  def create?
    return true if user.present? && (rol == "admin" || rol == "admin_ind")
  end

  def show?
    return true if user.present? && (rol == "admin" || rol == "admin_ind" || rol == "cli_ind")
  end

  def update?
    return true if user.present? && (rol == "admin" || rol == "admin_ind")
  end

  def destroy?
    return true if user.present? && (rol == "admin" || rol == "admin_ind")
  end

  private

  def kpi
    record
  end
end

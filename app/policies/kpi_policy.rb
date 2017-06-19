class KpiPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    p "usuario- poli -index"
    return true if user.present? && (rol == "admin" || rol == "admin_ind" || rol == "cli_ind")
  end

  def create?
    p "usuario- poli -create"
    return true if user.present? && (rol == "admin" || rol == "admin_ind")
  end

  def show?
    p "usuario- poli -show"
    return true if user.present? && (rol == "admin" || rol == "admin_ind" || rol == "cli_ind")
  end

  def update?
    p "usuario- poli -update"
    return true if user.present? && (rol == "admin" || rol == "admin_ind")
  end

  def destroy?
    p "usuario- poli -destroy"
    return true if user.present? && (rol == "admin" || rol == "admin_ind")
  end

  private

  def usuario
    record
  end
end

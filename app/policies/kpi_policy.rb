class KpiPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  rol = user.rol?(user.id)
  def index?
    p "usuario- poli -index"
    return true if user.present? && (rol.alias == "admin" || rol.alias == "admin_ind" || rol.alias == "cli_ind")
  end

  def create?
    p "usuario- poli -create"
    return true if user.present? && (rol.alias == "admin" || rol.alias == "admin_ind")
  end

  def show?
    p "usuario- poli -show"
    return true if user.present? && (rol.alias == "admin" || rol.alias == "admin_ind" || rol.alias == "cli_ind")
  end

  def update?
    p "usuario- poli -update"
    return true if user.present? && (rol.alias == "admin" || rol.alias == "admin_ind")
  end

  def destroy?
    p "usuario- poli -destroy"
    return true if user.present? && (rol.alias == "admin" || rol.alias == "admin_ind")
  end

  private

  def usuario
    record
  end
end

class KpiPolicy < ApplicationPolicy

  rol = user.rol?(user.id)
  def index?
    p "kpi- poli -index"
    return true if user.present? && (rol.alias == "admin" || rol.alias == "admin_ind" || rol.alias == "cli_ind")
  end

  def create?
    p "kpi- poli -create"
    return true if user.present? && (rol.alias == "admin" || rol.alias == "admin_ind")
  end

  def show?
    p "kpi- poli -show "
    return true if user.present? && (rol.alias == "admin" || rol.alias == "admin_min" || rol.alias == "cli_ind?")
  end

  def update?
    p "kpi- poli -update"
    return true if user.present? && (rol.alias == "admin" || rol.alias == "admin_min")
  end

  def destroy?
    p "kpi- poli -destroy"
    return true if user.present? && (rol.alias == "admin" || rol.alias == "admin_min")
  end

  private

  def kpi
    record
  end
end
class KpiPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.present?
        if (admin? || admin_ind?)
          p "Scope- es admin y admin ind kpi"
          scope.all
        elsif cli_ind?
          p "Scope- es admin mineria kpi"
          #ind = PermisosAsignado.where("usuario_id = ? and role_id = ?", usuario.id, 7).pluck(:recurso)
          #scope.where("id in (?)", ind)
          scope.all
        end
      end
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

  def kpi
    record
  end
end

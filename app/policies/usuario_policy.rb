class UsuarioPolicy < ApplicationPolicy
    def index?
    p "usuario- poli -index"
    p "EL ROL "+rol.inspect
    return true if user.present? && (rol == "admin" || rol == "admin_ind" || rol == "admin_min")
  end

  def create?
    p "usuario- poli -create"
    p "EL ROL "+rol.inspect
    true
  end

  def show?
    p "usuario- poli -show"
    p "EL ROL "+rol.inspect
    return true if user.present? && (rol == "admin" || rol.alias == "admin_ind" || rol == "admin_min")
  end

  def update?
    p "usuario- poli -update"
    p "EL ROL "+rol.inspect
    return true if user.present? && (rol == "admin" || rol == "admin_ind" || rol == "admin_min")
  end

  def destroy?
    p "usuario- poli -destroy"
    p "EL ROL "+rol.inspect
    return true if user.present? && (rol == "admin" || rol == "admin_ind" || rol == "admin_min")
  end

  class Scope < Scope
    def resolve
      if admin?
        p "Scope- es admin"
        scope.all
      elsif admin_min?
        p "Scope- es admin mineria"
        scope.where("role_id in (?)", "2,4,5,6")
      elsif admin_ind?
        p "Scope- es indicadores"
        scope.where("role_id in (?)", "3,7")
      end
    end
  end

  private

  def usuario
    record
  end
end
class UsuarioPolicy < ApplicationPolicy
    def index?
    return true if user.present? && (rol == "admin" || rol == "admin_ind" || rol == "admin_min")
  end

  def create?
    true
  end

  def show?
    return true if user.present? && (rol == "admin" || rol == "admin_ind" || rol == "admin_min" || rol == "cli_ind" || rol == "cli" || rol == "cons_lid" || rol == "cons")
  end

  def update?
    return true if user.present? && (rol == "admin" || rol == "admin_ind" || rol == "admin_min" || rol == "cli_ind")
  end

  def destroy?
    return true if user.present? && (rol == "admin" || rol == "admin_ind" || rol == "admin_min")
  end

  class Scope < Scope
    def resolve
      if user.present?
        if admin?
          scope
        elsif admin_min?
          scope.where("role_id in (2,4,5,6)")
        elsif admin_ind?
          scope.where("role_id in (3,7)")
        elsif cli_ind? or cli? cons_lid? or cons?
          scope
        end
      end
    end
  end

  private

  def usuario
    record
  end
end
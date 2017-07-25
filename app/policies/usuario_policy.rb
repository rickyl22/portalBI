class UsuarioPolicy < ApplicationPolicy
    def index?
    p "usuario- poli -index"
    return true if user.present? && (rol == "admin" || rol == "admin_ind" || rol == "admin_min")
  end

  def create?
    true
  end

  def show?
    return true if user.present? && (rol == "admin" || rol.alias == "admin_ind" || rol == "admin_min")
  end

  def update?
    return true if user.present? && (rol == "admin" || rol == "admin_ind" || rol == "admin_min")
  end

  def destroy?
    return true if user.present? && (rol == "admin" || rol == "admin_ind" || rol == "admin_min")
  end

  class Scope < Scope
    def resolve
      if user.present?
        if admin?
          scope.all
        elsif admin_min?
          scope.where("role_id in (?)", "2,4,5,6")
        elsif admin_ind?
          scope.where("role_id in (?)", "3,7")
        end
      end
    end
  end

  private

  def usuario
    record
  end
end
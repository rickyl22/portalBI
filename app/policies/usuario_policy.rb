class UsuarioPolicy < ApplicationPolicy

  rol = user.rol?(user.id)
  def index?
    p "usuario- poli -index"
    return true if user.present? && (rol.alias == "admin" || rol.alias == "admin_ind" || rol.alias == "admin_min")
  end

  def create?
    p "usuario- poli -create"
    true
  end

  def show?
    p "usuario- poli -show"
    return true if user.present? && (rol.alias == "admin" || rol.alias == "admin_ind" || rol.alias == "admin_min")
  end

  def update?
    p "usuario- poli -update"
    return true if user.present? && (rol.alias == "admin" || rol.alias == "admin_ind" || rol.alias == "admin_min")
  end

  def destroy?
    p "usuario- poli -destroy"
    return true if user.present? && (rol.alias == "admin" || rol.alias == "admin_ind" || rol.alias == "admin_min")
  end

  private

  def usuario
    record
  end
end
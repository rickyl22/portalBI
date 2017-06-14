class UsuarioPolicy < ApplicationPolicy

  def index?
    return true if user.present?
  end

  def create?
    p "ENTRA create user"
    true
  end

  def show?
    p "USER "+user.role.inspect
    p "USUARIO "+usuario.inspect
    rol = user.rol?(user.id)
    return true if user.present? && (rol.alias == "admin" || rol.alias == "admin_min" || rol.alias == "admin_ind")

  end

  def update?
    rol = user.rol?(user.id)
    if (user.present?)
      return true if (rol.alias == "admin" || rol.alias == "admin_min" || rol.alias == "admin_ind")
    end

    return true if user.present? && user == article.user
    true
  end

  def destroy?
    p "destroy"
    true
  end

  private

  def usuario
    record
  end
end
class CasoPolicy < ApplicationPolicy

  def index?
    p "usuario- poli -icasos"
    p user
    return true if user.present? && rol != "admin_ind"
  end

  def new
  	return true if user.present? && (rol == "admin" || rol == "cli" || rol == "admin_min" )
  end

  def create?
    p "usuario- poli -create"
    p "EL ROL "+rol.inspect
    return true if user.present? && (rol == "admin" || rol == "cli" || rol == "admin_min" ) 
  end

  def show?
    p "usuario- poli -create"
    p "EL ROL "+rol.inspect
    return true if user.present? && (rol == "admin" || rol == "admin_min" || (rol == "cli" && @record.usuario_id == user.id) || (rol == "cons" && @record.consultor_id == user.usuario) || ( rol == "cons_lid" && @record.infosoft == "SI") ) 
  end

  class Scope < Scope
    def resolve
      if admin?
        p "Scope- es admin"
        scope.all
      elsif admin_min?
        p "Scope- es admin mineria"
        scope.all
      elsif user.role.alias == 'cli' 
        p "Scope- es clit"
        scope.where("usuario_id = ?", user.id)
      elsif user.role.alias == 'cons_lid'
      	scope.where("infosoft = 'SI'")
      elsif user.role.alias == 'cons'
        scope.where("consultor_id = ?", user.usuario)	
      end
    end
  end
end

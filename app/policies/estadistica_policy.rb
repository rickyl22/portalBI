class EstadisticaPolicy < ApplicationPolicy

  def index?
    return true if user.present? and (rol == "admin" or rol == "admin_min" or rol == "cons_lid") 
  end

  def new
  	return true if user.present? && (rol == "admin" || rol == "cli" || rol == "admin_min" )
  end

  def create?
    return true if user.present? && (rol == "admin" || rol == "admin_min" || rol == "cons_lid" ) 
  end

  def show?
    return true if user.present? && (rol == "admin" || rol == "admin_min" || (rol == "cli" && @record.usuario_id == user.id) || (rol == "cons" && @record.consultor_id == user.usuario) || ( rol == "cons_lid" && @record.infosoft == "SI") ) 
  end

  class Scope < Scope
    def resolve
      if admin?
        scope.all
      elsif admin_min?
        scope.all
      elsif user.role.alias == 'cli' 
        scope.where("usuario_id = ?", user.id)
      elsif user.role.alias == 'cons_lid'
      	scope.where("infosoft = 'SI'")
      elsif user.role.alias == 'cons'
        scope.where("consultor_id = ?", user.usuario)	
      end
    end
  end
end
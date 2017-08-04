class RecargaPolicy < ApplicationPolicy

  def index?
    return true if user.present? and (rol == "admin" or rol == "admin_ind" ) 
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
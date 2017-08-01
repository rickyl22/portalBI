class MenusController < ApplicationController
  before_action :require_authentication
  skip_after_action :verify_policy_scoped
  skip_after_action :verify_authorized

  def menu_principal
    @usuario = Usuario.find(current_user.id)
    @usuarios_pendientes = Usuario.where("estatus = ?", "0")
    #@casos_recientes = Caso.all.ord.order("id DESC")
    @indicadores_recientes = Kpi.all.order("id DESC")
  end

  def menu_ind
    @usuario = Usuario.find(current_user.id)
    @usuarios_pendientes = Usuario.where("estatus = 0 and role_id = 7")
    @indicadores_recientes = Kpi.all.order("id DESC")

  end

  def menu_min
  end
end

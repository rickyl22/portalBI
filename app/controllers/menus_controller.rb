class MenusController < ApplicationController
  before_action :require_authentication
  skip_after_action :verify_policy_scoped
  skip_after_action :verify_authorized

  def index
    @usuario = Usuario.find(current_user.id)
    @usuarios_pendientes = Usuario.where("estatus = ?", "Pendiente")
    #@casos_recientes = Caso.where().ord
    @indicadores_recientes = Kpi.where("limit")

  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

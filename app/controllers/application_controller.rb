class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action :verify_authorized
  after_action :verify_policy_scoped
  include SessionsHelper
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  def admin?
    true if(current_user.role.alias == "admin")
  end

  def admin_min?
    true if(current_user.role.alias == "admin_min")
  end

  def admin_ind?
    true if(current_user.role.alias == "admin_ind")
  end

  def cons_lid?
    true if(current_user.role.alias == "cons_lid")
  end

  def cons?
    true if(current_user.role.alias == "cons")
  end

  def cli?
    true if(current_user.role.alias == "cli")
  end

  def cli_ind?
    true if(current_user.role.alias == "cli_ind")
  end

  def rol_usuario()
    return current_user.role.alias
  end

  def modulo()
    modulo = "Todos" if (current_user.role.alias == "admin")
    modulo = "Mineria, CRU Mineria, Usuarios de Mineria" if (current_user.role.alias == "admin_min")
    modulo = "Indicadores, CRUD Indicadores, Usuarios de Indicadores" if (current_user.role.alias == "admin_ind")
    modulo = "Mineria, CRU Mineria" if (current_user.role.alias == "cons_lid")
    modulo = "Mineria, Casos Asignados" if (current_user.role.alias == "cons")
    modulo = "Mineria, C Casos" if (current_user.role.alias == "cli")
    modulo = "Indicadores, Ver Indicadores" if (current_user.role.alias == "cli_ind")
    return modulo
  end


  private

  def user_not_authorized
    redirect_to login_path, notice: 'Debe iniciar sesión para acceder al sistema'
  end


end

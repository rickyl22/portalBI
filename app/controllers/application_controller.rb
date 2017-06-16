class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  after_action :verify_authorized
  after_action :verify_policy_scoped
  include SessionsHelper
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  def admin?
    p "admin?puu"
    true if(current_user.role.alias == "admin")
  end

  def admin_min?
    p "admin_min??++++"
    true if(current_user.role.alias == "admin_min")
  end

  def admin_ind?
    p "admin_ind??"
    true if(current_user.role.alias == "admin_ind")
  end

  def cons_lid?
    p "cons_lid??"
    true if(current_user.role.alias == "cons_lid")
  end

  def cons?
    p "cons??"
    true if(current_user.role.alias == "cons")
  end

  def cli?
    p "cli??"
    true if(current_user.role.alias == "cli")
  end

  private

  def user_not_authorized
    p "ENTRA a rechazar usuario"
    redirect_to login_path, notice: 'Debe iniciar session para acceder al sistema sapo!!!'
  end


end

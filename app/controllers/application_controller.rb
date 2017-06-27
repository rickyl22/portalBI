class ApplicationController < ActionController::Base

  handle_asynchronously :in_the_future, :run_at => Proc.new { 10.hours.from_now }
  protect_from_forgery with: :exception
  after_action :verify_authorized
  after_action :verify_policy_scoped
  include SessionsHelper
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def in_the_future
   p "hola ricky"
  end
  
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

  private

  def user_not_authorized
    redirect_to login_path, notice: 'Debe iniciar sesión para acceder al sistema'
  end


end

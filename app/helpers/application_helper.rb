module ApplicationHelper
  def rol
    return current_user.role.alias
  end
  def admin?
    p "admin?"
    true if(!current_user.nil? && current_user.role.alias == "admin")
  end

  def admin_min?
    p "admin_min?? ---- "
    true if(!current_user.nil? && current_user.role.alias == "admin_min")
  end

  def admin_ind?
    p "admin_ind??"
    true if(!current_user.nil? && current_user.role.alias == "admin_ind")
  end

  def cons_lid?
    p "cons_lid??"
    true if(!current_user.nil? && current_user.role.alias == "cons_lid")
  end

  def cons?
    p "cons??"
    true if(!current_user.nil? && current_user.role.alias == "cons")
  end

  def cli?
    p "cli??"
    true if(!current_user.nil? && current_user.role.alias == "clis")
  end

  def cli_ind?
    p "cli_ind?"
    true if(!current_user.nil? && current_user.role.alias == "cli_ind")
  end

  def log_in(usuario)
    session[:usuario_id] = usuario.id
  end
  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= Usuario.find_by(id: session[:usuario_id])
  end
  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
  # Logs out the current user.
  def log_out
    session.delete(:usuario_id)
    @current_user = nil
  end
  def require_authentication
    current_user || redirect_to(home_index_path, :alert => 'El acceso sin sessions esta restrigido')
  end

end

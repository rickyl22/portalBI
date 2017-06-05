class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= Usuario.find(session[:usuario_id]) if session[:usuario_id]
  end
  helper_method :current_user

  def require_authentication
    current_user || redirect_to(home_index_path, :alert => 'El acceso sin sessions esta restrigido')
  end

end

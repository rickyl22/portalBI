class SessionsController < ApplicationController
  skip_after_action :verify_policy_scoped
  skip_after_action :verify_authorized
  layout 'layout'
  def index
  end

  def create
    
    usuario = Usuario.where("usuario = ?",params[:usuario]).first
    if usuario  && usuario.authenticate(params[:password]) && (usuario.estatus == "Aprobado")

      log_in usuario
      session[:notice] = nil
      if admin?
        if Caso.where(" complejidad = 'No Asignada' and fecha_creado < ?", Time.now.to_date - 7).length > 0 
          session[:notice] = "Advertencia: Tiene casos con mas de 7 dias de creación sin complejidad asignada"
          redirect_to menus_path, notice: "Advertencia: Tiene casos con mas de 7 dias de creación sin complejidad asignada"
        else 
          redirect_to menus_path
        end
      elsif admin_ind?
        redirect_to kpis_path
      elsif admin_min?
        if Caso.where(" complejidad = 'No Asignada' and fecha_creado < ?", Time.now.to_date - 7).length > 0 
          redirect_to menus_path, notice: "Advertencia: Tiene casos con mas de 7 dias de creación sin complejidad asignada"
        else 
          redirect_to menus_path
        end
      else
        redirect_to menus_path
      end
      cookies[:usuario] = usuario.usuario
    else
      flash.now.alert = 'Correo o clave incorrecto'
      redirect_to login_path, alert: "Correo o clave incorrecto"
    end

  end

  def new
    @usuarios = Usuario.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
    log_out
    cookies.delete(:usuario)
    session[:notice] = nil
    current_user = nil
    flash.now.alert = 'Logged out!'
    redirect_to root_url
  end
end

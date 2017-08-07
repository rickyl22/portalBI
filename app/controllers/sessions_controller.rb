class SessionsController < ApplicationController
  skip_after_action :verify_policy_scoped
  skip_after_action :verify_authorized
  def index
  end

  def create
    usuario = Usuario.where("usuario = ?",params[:usuario]).first
    if usuario && (usuario.estatus) && usuario.authenticate(params[:password])
      log_in usuario
      session[:notice] = nil
      session[:last_check] = Time.now
      casos = Caso.where(" complejidad = 'No Asignada' and fecha_creado < ?", Time.now.to_date - 7)
      if admin?
        if casos.length > 0
          redirect_to '/menus/menu_principal', alert: "Tiene casos con mas de 7 dias de creación sin complejidad asignada"
        else
          redirect_to '/menus/menu_principal'
        end
      elsif admin_ind?
        redirect_to '/menus/menu_ind'
      elsif admin_min?
        redirect_to '/menus/menu_min'
      elsif cons_lid?
        redirect_to '/casos'
      elsif cons?
        redirect_to '/menus/menus/menu_consultor'
      elsif cli?
        if casos.length > 0
          redirect_to '/casos', alert: "Tiene casos con mas de 7 días de creación sin complejidad asignada"
        else 
          redirect_to '/casos'
        end
      elsif cli_ind?
        redirect_to '/kpis'
      end
      cookies[:usuario] = usuario.usuario
    else
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
    flash.now.alert = 'Sesión cerrada'
    redirect_to root_url
  end

end

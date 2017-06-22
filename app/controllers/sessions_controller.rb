class SessionsController < ApplicationController
  skip_after_action :verify_policy_scoped
  skip_after_action :verify_authorized
  layout 'layout'
  def index
  end

  def create
    p "ACA??"
    usuario = Usuario.where("usuario = ?",params[:usuario]).first
    if usuario  && usuario.authenticate(params[:password]) && (usuario.estatus == "Aprobado")

      log_in usuario
      if admin?
        redirect_to menus_path
      elsif admin_ind?
        redirect_to kpis_path
      elsif admin_min?
        redirect_to menus_path
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
    current_user = nil
    flash.now.alert = 'Logged out!'
    redirect_to root_url
  end
end

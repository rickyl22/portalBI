class SessionsController < ApplicationController
  skip_after_action :verify_policy_scoped
  skip_after_action :verify_authorized
  layout 'layout'
  def index
  end

  def create
    usuario = Usuario.where("usuario = ?",params[:usuario]).first
    if usuario  && usuario.authenticate(params[:password]) #&& (usuario.estatus == "Aprobado")
      log_in usuario
      redirect_to menus_path, notice: 'Login exitoso!'
      cookies[:usuario] = usuario.usuario
    else
      flash.now.alert = 'Correo o clave incorrecto'
      redirect_to login_path
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
    flash.now.alert = 'Logged out!'
    redirect_to root_url
  end
end

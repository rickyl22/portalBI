class SessionsController < ApplicationController
  skip_after_action :verify_policy_scoped
  skip_after_action :verify_authorized
  def index
  end

  def create
    usuario = Usuario.where("usuario = ?",params[:usuario]).first
    p "Estatus "+usuario.estatus.to_s
    if usuario && (usuario.estatus) && usuario.authenticate(params[:password])
      log_in usuario
      if admin?
        redirect_to '/menus/menu_principal'
      elsif admin_ind?
        redirect_to '/menus/menu_ind'
      elsif admin_min?
        redirect_to '/menus/menu_min'
      elsif cons_lid?
        redirect_to '/menus/menu_consultor_lid'
      elsif cons?
        redirect_to '/menus/menus/menu_consultor'
      elsif cli?
        redirect_to '/menus/menus/menu_cliente'
      end
      #redirect_to menus_path, notice: 'Login exitoso!'
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
    flash.now.alert = 'Logged out!'
    redirect_to root_url
  end

end

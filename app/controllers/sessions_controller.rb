class SessionsController < ApplicationController
  layout 'layout'
  def index
  end

  def create
    p "entra aca"
    usuario = Usuario.where("usuario = ?",params[:usuario]).first
    p "ESTATUS "+usuario.estatus.inspect
    p "USUARIO "+usuario.inspect
    if usuario && (usuario.estatus == "Aprobado") && usuario.authenticate(params[:password])
      p "Autenticacion exitosa"
      session[:usuario_id] = usuario.id
      redirect_to menus_path, notice: 'Login exitoso!'
    else
      p "Autenticacion fallida"
      flash.now.alert = 'Correo o clave incorrecto'
      #redirect_to usuarios_path
      redirect_to new_session_path, notice: 'Login fallido!'
      #render :new
    end

    p "SESSION "+session.inspect
  end

  def new
    p "aca en new"
    @usuarios = User.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
    session[:usuario_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end

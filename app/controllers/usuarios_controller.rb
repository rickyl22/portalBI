class UsuariosController < ApplicationController
  def index
    if(params[:flag])
      @usuarios = Usuario.where("title='Ricardo' ")
    else
      @users = Usuario.all
    end
  end

  def create
    @usuario = Usuario.create(allowed_params)
    @usuario.save
    redirect_to @usuario
  end

  def new
    @usuario = Usuario.new
  end

  def edit
    @usuario = Usuario.find(params[:id])
  end

  def show
    @usuario = Usuario.find(params[:id])
  end

  def update
    @usuario = Usuario.find(params[:id])

    if @usuario.update_attributes(params[:usuario])
      redirect_to @usuario
    else
      render 'edit'
    end
  end

  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy

    redirect_to usuarios_path_path
  end

  def allowed_params
    params.require(:usuario).permit(:estatus, :usuario, :codigo_empleado, :nombre, :apellido, :correo, :cargo, :area, :supervisor, :gerencia, :telefono, :password_digest, :justificacion, :password, :password_confirmation)
  end

end

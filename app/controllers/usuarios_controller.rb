class UsuariosController < ApplicationController
  before_action :set_usuario,  only: [:edit, :update, :destroy]
  skip_after_action :verify_policy_scoped
  #skip_after_action :verify_authorized#, :only => [:create, :allowed_params]
  #after_action :verify_authorized
  #after_action :verify_authorized, :except => :index, unless: :devise_controller?
  #after_action :verify_authorized, :only => :index

  def index

    @usuarios = policy_scope(Usuario)
    #reset_session
    p "Usuario d ela sesion index "+session[:usuario_id].inspect
    authorize @usuarios
  end

  def create
    p "yoo"
    p allowed_params
    @usuario = Usuario.create(allowed_params)
    authorize @usuario
    @usuario.save
    p "Usuario d ela sesion create "+session[:usuario_id].inspect
    redirect_to login_path
  end

  def new
    @usuario = Usuario.new
    #authorize @usuario
  end

  def edit
    @usuario = Usuario.find(params[:id])
  end

  def show
   @usuario = Usuario.find(params[:id])
   p "Usuario d ela sesion show "+session[:usuario_id].inspect
   authorize @usuario
  end

  def update
    @usuario = Usuario.find(params[:id])
    # authorize @usuario
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

  private
    def set_usuario
      p"ENTRA ACAAA"
      @usurio = Usuario.find(params[:id])
      authorize @usuario
    end

  def allowed_params
    params.require(:usuario).permit(:estatus, :role_id, :usuario, :codigo_empleado, :nombre, :apellido, :correo, :cargo, :area, :supervisor, :gerencia, :telefono, :password_digest, :justificacion, :password, :password_confirmation)
  end

end

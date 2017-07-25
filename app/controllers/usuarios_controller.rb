class UsuariosController < ApplicationController
  before_action :set_usuario,  only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, :except => [:create, :new]
  #after_action :verify_policy_scoped#, :except => [:index]
  #skip_after_action :verify_authorized#, :only => [:create, :allowed_params]
  #after_action :verify_authorized
  #after_action :verify_authorized, :except => :index, unless: :devise_controller?
  #after_action :verify_authorized, :only => :index

  def index
    @usuarios = Usuario.all
    authorize @usuarios
    @usuarios = policy_scope(Usuario)
    #reset_session
  end

  def create
    @usuario = Usuario.create(usuario_params)
    authorize @usuario
    if (params[:solicitud_reg])
      p "Es una solicitud de registro de usuario"
      @usuario.estatus = 0
      @usuario.role_id = 8
    end

    if @usuario.save
      if logged_in?
        redirect_to usuarios_path
      else
        redirect_to login_path, notice: 'Petición enviada'
      end
    else
      if logged_in?
        redirect_to usuarios_path
      else
        redirect_to login_path, error: 'Error creando usuario'
      end
    end

  end

  def new
    @usuario = Usuario.new
    authorize @usuario
  end

  def edit
    @usuario = Usuario.find(params[:id])
    #@usuario = policy_scope(Usuario).find(params[:id])
  end

  def show
   @usuario = Usuario.find(params[:id])
   respond_to do |format|
     format.html
     format.json {
       if params[:checked]
         @usuario.estatus = 1
         @usuario.role_id = params[:rol_id]
       else
         @usuario.estatus = 0
         @usuario.role_id = 8
       end
       @usuario.password_digest = @usuario.password_digest
       @usuario.save
       render json: @usuario }
   end


   #authorize @usuario
  end

  def update
    @usuario = Usuario.find(params[:id])
    # authorize @usuario
    if @usuario.update_attributes(usuario_params)
      redirect_to @usuario,  notice: 'Usuario actualizado'
    else
      render 'edit', error: 'Error actualizando usuario'
    end
  end

  def destroy

    @usuario = Usuario.find(params[:id])
    @usuario.destroy
    redirect_to usuarios_path, notice: "Usuario #{@usuario.nombre} - #{@usuario.codigo_empleado} Eliminado"
  end

  private
    def set_usuario
      @usuario = Usuario.find(params[:id])
      authorize @usuario
      @usuario = policy_scope(Usuario).find(params[:id])
    end

  def usuario_params
    params.require(:usuario).permit(:estatus, :role_id, :usuario, :codigo_empleado, :nombre, :apellido, :correo, :cargo, :area, :supervisor, :gerencia, :telefono, :password_digest, :justificacion, :password, :password_confirmation)
  end

end

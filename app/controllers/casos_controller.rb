class CasosController < ApplicationController
  before_action :set_caso, only: [:show, :edit, :update, :destroy]

  def iniciar
    session[:usuario_id] = 1
    session[:usuario_tipo] = params[:user_tipo]

  end

  # GET /casos
  def index
    
   
    if session[:usuario_tipo] == "Admin"
       if params[:self] == '1'
          @self = "1"
          @casos = Caso.where("usuario = "+session[:usuario_id].to_s)
       else
        p "no  self"
        @self = "0"
          @casos = Caso.where("infosoft = 'NO'")
          @casos2 = Caso.where("status = 'En proceso'")
          @casos3 = Caso.where("status = 'Cerrado'")
       end
    elsif session[:usuario_tipo] == "cliente"
       @casos = Caso.where("usuario = "+session[:usuario_id].to_s)
    elsif session[:usuario_tipo] == "Infosoft-Admin"
      if params[:self] == '1'
          @casos = Caso.where("usuario = "+session[:usuario_id].to_s)
      else    
          @casos = Caso.where("infosoft = 'SI'")
      end
    else 
       @casos = Caso.where("usuario = "+session[:usuario_id].to_s)
    end
  end

  # GET /casos/1
  def show
    @comments = Comentario.all
  end

  # GET /casos/new
  def new
    @caso = Caso.new
  end

  # GET /casos/1/edit
  def edit
    redirect_back(fallback_location:root_path)
  end

  # POST /casos
  def create
    @caso = Caso.new(caso_params)
    @campos = params[:campos]
    @string = ""
    @campos.each { |x| if x != "" then @string << x +" - " end}
    @string = @string[0...-3]
   
    p "hola"
    p caso_params
    p "hola2"
    p params
    @usuario = Usuario.find(1)
    if @usuario.casos.create(caso_params.merge(:campos => @string))
      redirect_to @caso, notice: 'Caso was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /casos/1
  def update
    if @caso.update(caso_params)
      #AsignadoMailer.asignar(1,2,3,"ricardolira48@hotmail.com").deliver
      redirect_to @caso, notice: 'Caso was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /casos/1
  def destroy
    @caso.destroy
    redirect_to casos_url, notice: 'Caso was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caso
      @caso = Caso.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def caso_params
      params.require(:caso).permit(:act_tabla, :agrup, :altas, :arpu, :campos, :complejidad, :condiciones, :consultor, :especifique, :fech_asig, :fecha_creado, :fecha_req, :fijo, :im, :infosoft, :movil, :otro, :parque, :periodo_desde, :periodo_hasta, :phone, :pre_post, :recargas, :separacion, :status, :tipo_archivo, :tipo_caso, :titulo, :tlv, :tv, :usuario_id)
    end
end

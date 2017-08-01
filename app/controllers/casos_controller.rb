class CasosController < ApplicationController
  before_action :set_caso, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, :only => [:index, :show]
  after_action :verify_authorized, :only => [:index, :create, :new, :show]
  #def iniciar
    #session[:usuario_id] = 1
   # session[:usuario_tipo] = params[:user_tipo]

  #end

  # GET /casos
  def index
    @flag = 0
    @casos = policy_scope(Caso)
    if params[:flag] != nil
      @flag = 1
    end
    authorize @casos
  end

  # GET /casos/1
  def show
    @casos = policy_scope(Caso)
    @comments = Comentario.all
    authorize @caso
  end

  # GET /casos/new
  def new
    @caso = Caso.new
    authorize @caso
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
    authorize @caso
    if current_user.casos.create(caso_params.merge(:campos => @string))
      current_user.casos.order("created_at").last.historial.create(:evento => "Creacion del caso", :usuario_id => current_user.id, :fecha => Time.now, :estatus => "Esperando asignacion de complejidad" )

      redirect_to @caso, notice: 'Caso creado satisfactoriamente'
    else
      render :new
    end
  end

  # PATCH/PUT /casos/1
  def update
    @estatus = ""
    if params[:caso][:status] != nil
      if params[:caso][:complejidad] != nil
        @estatus = "" + params[:estatus] + params[:caso][:complejidad]
      else
        @estatus = "" + params[:estatus] + params[:caso][:status]
      end
    else
       @estatus = params[:estatus]
    end
    @asig = @caso.complejidad == "No Asignada"
    if params[:caso][:status] == "Cerrado"
       params[:caso][:fecha_cerrado] = Date.today
    end
    if @caso.update(caso_params)
      @caso.historial.create(:evento => @estatus, :fecha => Time.now, :usuario_id => current_user.id)
      @dias = ""
      if @caso.complejidad == "Bajo"
         @dias = 4
      elsif @caso.complejidad == "Medio"
         @dias = 5
      elsif @caso.complejidad == "Alto"
         @dias = 7
      else
         @dias = 3
      end
      if @asig and caso_params[:complejidad] != "No Asignada"
          AsignadoMailer.asignar(@caso.complejidad,@caso.titulo,@dias,Usuario.find(@caso.usuario_id).correo).deliver  
      end 
      if params[:caso][:status] != nil
          if params[:caso][:status] == "BI-Afectado"
            AsignadoMailer.bi_afectado(Usuario.find(@caso.usuario_id).correo,@caso.titulo).deliver
          end
      end
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
    def car_params
        params.require(:car)
    end

    def caso_params
      params.require(:caso).permit(:consultor_id, :act_tabla, :agrup, :altas, :arpu, :campos, :complejidad, :condiciones, :consultor, :especifique, :fech_asig, :fecha_creado, :fecha_req, :fecha_cerrado, :fijo, :im, :infosoft, :movil, :otro, :parque, :periodo_desde, :periodo_hasta, :phone, :pre_post, :recargas, :separacion, :status, :tipo_archivo, :tipo_caso, :titulo, :tlv, :tv, :usuario_id)
    end
end

class CasosController < ApplicationController
  before_action :set_caso, only: [:show, :edit, :update, :destroy]
  skip_after_action :verify_policy_scoped
  skip_after_action :verify_authorized

  def iniciar
    #session[:usuario_id] = 1
    session[:usuario_tipo] = params[:user_tipo]

  end

  # GET /casos
  def index
    
    if admin?
      p "es ad"
          @casos = Caso.where("infosoft = 'NO' and status != 'Cerrado' ")
          @casos2 = Caso.where("status = 'En proceso'")
          @casos3 = Caso.where("status = 'Cerrado'")
    elsif cli?
      p "es cli"
       @casos = Caso.where("usuario_id = "+session[:usuario_id].to_s)
    elsif cons_lid?
      p "es inf lid"
      if params[:self] == '1'
          @casos = Caso.where("usuario_id = "+session[:usuario_id].to_s)
      else    
          @casos = Caso.where("infosoft = 'SI'")
      end
    else 
       p "es inf"
       @casos = Caso.all#where("usuario_id = "+session[:usuario_id].to_s)
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
    if current_user.casos.create(caso_params.merge(:campos => @string))
      redirect_to @caso, notice: 'Caso creado satisfactoriamente'
    else
      render :new
    end
  end

  # PATCH/PUT /casos/1
  def update
    @asig = @caso.complejidad == "No Asignada"
    if params[:caso][:status] == "Cerrado"
       params[:caso][:fecha_cerrado] = Date.today
    end
    if @caso.update(caso_params)
      if @asig and caso_params[:complejidad] != "No Asignada"
          #AsignadoMailer.asignar(1,2,3,"ricardolira48@hotmail.com").deliver  
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
    def caso_params
      params.require(:caso).permit(:act_tabla, :agrup, :altas, :arpu, :campos, :complejidad, :condiciones, :consultor, :especifique, :fech_asig, :fecha_creado, :fecha_req, :fecha_cerrado, :fijo, :im, :infosoft, :movil, :otro, :parque, :periodo_desde, :periodo_hasta, :phone, :pre_post, :recargas, :separacion, :status, :tipo_archivo, :tipo_caso, :titulo, :tlv, :tv, :usuario_id)
    end
end

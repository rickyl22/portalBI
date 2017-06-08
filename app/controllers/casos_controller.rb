class CasosController < ApplicationController
  before_action :set_caso, only: [:show, :edit, :update, :destroy]

  # GET /casos
  def index
    
    session[:usuario_id] = 1
    session[:usuario_tipo] = "Infosoft-Admin"
    if session[:usuario_tipo] == "Admin"
       @casos = Caso.all
    elsif session[:usuario_tipo] == "cliente"
       @casos = Caso.where("usuario = "+session[:usuario_id].to_s)
    elsif session[:usuario_tipo] == "Infosoft-Admin"
       @casos = Caso.where("infosoft = 'SI'")
    else 
       @casos = Caso.where("usuario = "+session[:usuario_id].to_s)
    end
    p "mmm"
    p session[:usuario_tipo]
    p "mmmmm"
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
    p "wow"
    p params[:par]
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
    p params[:campos]
    p "hola"
    @caso[:campos] = @string
    if @caso.save
      redirect_to @caso, notice: 'Caso was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /casos/1
  def update
    if @caso.update(caso_params)
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
      params.require(:caso).permit(:act_tabla, :agrup, :altas, :arpu, :campos, :complejidad, :condiciones, :consultor, :especifique, :fech_asig, :fecha_creado, :fecha_req, :fijo, :im, :infosoft, :movil, :otro, :parque, :periodo_desde, :periodo_hasta, :phone, :pre_post, :recargas, :separacion, :status, :tipo_archivo, :tipo_caso, :titulo, :tlv, :tv, :usuario)
    end
end

class CasosController < ApplicationController
  before_action :set_caso, only: [:show, :edit, :update, :destroy]

  # GET /casos
  def index
    @casos = Caso.all
  end

  # GET /casos/1
  def show
  end

  # GET /casos/new
  def new
    @caso = Caso.new
  end

  # GET /casos/1/edit
  def edit
  end

  # POST /casos
  def create
    @caso = Caso.new(caso_params)

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
      params.require(:caso).permit(:act_tabla, :agrup, :altas, :arpu, :campos, :complejidad, :condiciones, :consultor, :especifique, :fech_asig, :fecha_creado, :fecha_req, :fijo, :im, :infosoft, :movil, :otro, :parque, :periodo, :phone, :pre_post, :recargas, :separacion, :status, :tipo_archivo, :tipo_caso, :titulo, :tlv, :tv, :usuario)
    end
end

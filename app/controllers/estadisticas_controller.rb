class EstadisticasController < ApplicationController
  before_action :set_estadistica, only: [:show, :edit, :update, :destroy]
  skip_after_action :verify_policy_scoped
  after_action :verify_authorized, only: [:create, :index]  
  
  # GET /estadisticas
  # GET /estadisticas.json
  def index
    @estadisticas = Estadistica.all
    authorize @estadisticas
  end

  # GET /estadisticas/1
  # GET /estadisticas/1.json
  def show
  end

  # GET /estadisticas/new
  def new
    @estadistica = Estadistica.new
  end

  # GET /estadisticas/1/edit
  def edit
  end

  # POST /estadisticas
  # POST /estadisticas.json
  def create
    @estadistica = Estadistica.new
    authorize @estadistica
    @desde = params[:desde]
    @hasta = params[:hasta]
    if params[:hist]
       p "pide m,as hist"
       redirect_to "/estadisticas?hist=1&desde="+@desde+"&hasta="+@hasta
    else
       redirect_to "/estadisticas?desde="+@desde+"&hasta="+@hasta
    end
  end

  # PATCH/PUT /estadisticas/1
  # PATCH/PUT /estadisticas/1.json
  def update
    respond_to do |format|
      if @estadistica.update(estadistica_params)
        format.html { redirect_to @estadistica, notice: 'Estadistica was successfully updated.' }
        format.json { render :show, status: :ok, location: @estadistica }
      else
        format.html { render :edit }
        format.json { render json: @estadistica.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estadisticas/1
  # DELETE /estadisticas/1.json
  def destroy
    @estadistica.destroy
    respond_to do |format|
      format.html { redirect_to estadisticas_url, notice: 'Estadistica was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estadistica
      @estadistica = Estadistica.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estadistica_params
      params.require(:estadistica).permit(:descripcion, :fecha_desde, :fecha_hasta, :cantidad)
    end
end

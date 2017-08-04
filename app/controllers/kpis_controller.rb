class KpisController < ApplicationController
  before_action :set_kpi, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, :except => [:create, :new]

  # GET /kpis
  # GET /kpis.json
  def index
    @kpis = Kpi.all
    authorize @kpis
    @kpis = policy_scope(Kpi)
  end

  # GET /kpis/1
  # GET /kpis/1.json
  def show
    @kpi = Kpi.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "indicadores",
               :layout => 'pdf_layout.html.erb',
               :template => "kpis/indicadores.pdf.erb",
               :javascript_delay => 5000
      end
    end
  end

  # GET /kpis/new
  def new
    @kpi = Kpi.new
    authorize @kpi
  end

  # GET /kpis/1/edit
  def edit
    @kpi = Kpi.find(params[:id])
  end

  # POST /kpis
  # POST /kpis.json
  def create
    @kpi = Kpi.new(kpi_params)
    authorize @kpi

    respond_to do |format|
      if @kpi.save
        format.html { redirect_to @kpi, notice: ' Indicador creado satisfactoriamente' }
        format.json { render :show, status: :created, location: @kpi }
      else
        format.html { render :new }
        format.json { render json: @kpi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kpis/1
  # PATCH/PUT /kpis/1.json
  def update
    respond_to do |format|
      if @kpi.update(kpi_params)
        format.html { redirect_to @kpi, notice: 'Indicador actualizado' }
        format.json { render :show, status: :ok, location: @kpi }
      else
        format.html { render :edit }
        format.json { render json: @kpi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kpis/1
  # DELETE /kpis/1.json
  def destroy
    @kpi.destroy
    respond_to do |format|
      format.html { redirect_to kpis_url, notice: 'Indicador eliminado' }
      format.json { head :no_content }
    end
  end

  def estatus
    endpoint = "localhost:9200/portal_mercadeo/recargas/_search?q=TERMINAL:SMARTPHONE"

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kpi
      @kpi = Kpi.find(params[:id])
      authorize @kpi
      @kpi = policy_scope(Kpi).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kpi_params
      params.require(:kpi).permit(:nombre, :descripcion, :portada, :dashboard, :url)
    end
end

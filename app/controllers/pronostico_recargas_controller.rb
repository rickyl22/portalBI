class PronosticoRecargasController < ApplicationController
  before_action :set_pronostico_recarga, only: [:show, :edit, :update, :destroy]

  # GET /pronostico_recargas
  # GET /pronostico_recargas.json
  def index
    @pronostico_recargas = PronosticoRecarga.all
  end

  # GET /pronostico_recargas/1
  # GET /pronostico_recargas/1.json
  def show
  end

  # GET /pronostico_recargas/new
  def new
    @pronostico_recarga = PronosticoRecarga.new
  end

  # GET /pronostico_recargas/1/edit
  def edit
  end

  # POST /pronostico_recargas
  # POST /pronostico_recargas.json
  def create
    @pronostico_recarga = PronosticoRecarga.new(pronostico_recarga_params)

    respond_to do |format|
      if @pronostico_recarga.save
        format.html { redirect_to @pronostico_recarga, notice: 'Pronostico recarga was successfully created.' }
        format.json { render :show, status: :created, location: @pronostico_recarga }
      else
        format.html { render :new }
        format.json { render json: @pronostico_recarga.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pronostico_recargas/1
  # PATCH/PUT /pronostico_recargas/1.json
  def update
    respond_to do |format|
      if @pronostico_recarga.update(pronostico_recarga_params)
        format.html { redirect_to @pronostico_recarga, notice: 'Pronostico recarga was successfully updated.' }
        format.json { render :show, status: :ok, location: @pronostico_recarga }
      else
        format.html { render :edit }
        format.json { render json: @pronostico_recarga.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pronostico_recargas/1
  # DELETE /pronostico_recargas/1.json
  def destroy
    @pronostico_recarga.destroy
    respond_to do |format|
      format.html { redirect_to pronostico_recargas_url, notice: 'Pronostico recarga was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pronostico_recarga
      @pronostico_recarga = PronosticoRecarga.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pronostico_recarga_params
      params.require(:pronostico_recarga).permit(:fecha, :cantidad)
    end
end

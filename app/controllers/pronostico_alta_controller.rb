class PronosticoAltaController < ApplicationController
  before_action :set_pronostico_altum, only: [:show, :edit, :update, :destroy]

  # GET /pronostico_alta
  # GET /pronostico_alta.json
  def index
    @pronostico_alta = PronosticoAltum.all
  end

  # GET /pronostico_alta/1
  # GET /pronostico_alta/1.json
  def show
  end

  # GET /pronostico_alta/new
  def new
    @pronostico_altum = PronosticoAltum.new
  end

  # GET /pronostico_alta/1/edit
  def edit
  end

  # POST /pronostico_alta
  # POST /pronostico_alta.json
  def create
    @pronostico_altum = PronosticoAltum.new(pronostico_altum_params)

    respond_to do |format|
      if @pronostico_altum.save
        format.html { redirect_to @pronostico_altum, notice: 'Pronostico altum was successfully created.' }
        format.json { render :show, status: :created, location: @pronostico_altum }
      else
        format.html { render :new }
        format.json { render json: @pronostico_altum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pronostico_alta/1
  # PATCH/PUT /pronostico_alta/1.json
  def update
    respond_to do |format|
      if @pronostico_altum.update(pronostico_altum_params)
        format.html { redirect_to @pronostico_altum, notice: 'Pronostico altum was successfully updated.' }
        format.json { render :show, status: :ok, location: @pronostico_altum }
      else
        format.html { render :edit }
        format.json { render json: @pronostico_altum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pronostico_alta/1
  # DELETE /pronostico_alta/1.json
  def destroy
    @pronostico_altum.destroy
    respond_to do |format|
      format.html { redirect_to pronostico_alta_url, notice: 'Pronostico altum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pronostico_altum
      @pronostico_altum = PronosticoAltum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pronostico_altum_params
      params.require(:pronostico_altum).permit(:fecha, :cantidad, :plataforma)
    end
end

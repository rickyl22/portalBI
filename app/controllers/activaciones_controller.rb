class ActivacionesController < ApplicationController
  before_action :set_activacione, only: [:show, :edit, :update, :destroy]
  skip_after_action :verify_policy_scoped
  skip_after_action :verify_authorized
  # GET /activaciones
  # GET /activaciones.json
  def index
    @activaciones = Activacione.all
  end

  # GET /activaciones/1
  # GET /activaciones/1.json
  def show
  end

  # GET /activaciones/new
  def new
    @activacione = Activacione.new
  end

  # GET /activaciones/1/edit
  def edit
  end

  # POST /activaciones
  # POST /activaciones.json
  def create
    @activacione = Activacione.new(activacione_params)

    respond_to do |format|
      if @activacione.save
        format.html { redirect_to @activacione, notice: 'Activacione was successfully created.' }
        format.json { render :show, status: :created, location: @activacione }
      else
        format.html { render :new }
        format.json { render json: @activacione.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activaciones/1
  # PATCH/PUT /activaciones/1.json
  def update
    respond_to do |format|
      if @activacione.update(activacione_params)
        format.html { redirect_to @activacione, notice: 'Activacione was successfully updated.' }
        format.json { render :show, status: :ok, location: @activacione }
      else
        format.html { render :edit }
        format.json { render json: @activacione.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activaciones/1
  # DELETE /activaciones/1.json
  def destroy
    @activacione.destroy
    respond_to do |format|
      format.html { redirect_to activaciones_url, notice: 'Activacione was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activacione
      @activacione = Activacione.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activacione_params
      params.require(:activacione).permit(:fecha, :cantidad, :plataforma)
    end
end

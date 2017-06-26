class HistorialsController < ApplicationController
  before_action :set_historial, only: [:show, :edit, :update, :destroy]
  skip_after_action :verify_policy_scoped
  skip_after_action :verify_authorized

  # GET /historials
  # GET /historials.json
  def index
    @caso = Caso.find(params[:caso])
    @historials = @caso.historial
  end

  # GET /historials/1
  # GET /historials/1.json
  def show
  end

  # GET /historials/new
  def new
    @historial = Historial.new
  end

  # GET /historials/1/edit
  def edit
  end

  # POST /historials
  # POST /historials.json
  def create
    @historial = Historial.new(historial_params)

    respond_to do |format|
      if @historial.save
        format.html { redirect_to @historial, notice: 'Historial was successfully created.' }
        format.json { render :show, status: :created, location: @historial }
      else
        format.html { render :new }
        format.json { render json: @historial.errors, 
          status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historials/1
  # PATCH/PUT /historials/1.json
  def update
    respond_to do |format|
      if @historial.update(historial_params)
        format.html { redirect_to @historial, notice: 'Historial was successfully updated.' }
        format.json { render :show, status: :ok, location: @historial }
      else
        format.html { render :edit }
        format.json { render json: @historial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historials/1
  # DELETE /historials/1.json
  def destroy
    @historial.destroy
    respond_to do |format|
      format.html { redirect_to historials_url, notice: 'Historial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historial
      @historial = Historial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historial_params
      params.require(:historial).permit(:evento, :fecha, :usuario_id, :estatus, :caso_id)
    end
end

class AltaController < ApplicationController
  before_action :set_altum, only: [:show, :edit, :update, :destroy]
  skip_after_action :verify_policy_scoped
  skip_after_action :verify_authorized
  # GET /alta
  # GET /alta.json
  def index
    @alta = Alta.all
  end

  # GET /alta/1
  # GET /alta/1.json
  def show
  end

  # GET /alta/new
  def new
    @altum = Alta.new
  end

  # GET /alta/1/edit
  def edit
  end

  # POST /alta
  # POST /alta.json
  def create
    @altum = Alta.new
    @desde = params[:desde]
    @hasta = params[:hasta]
    @data = "&desde="+@desde+"&hasta="+@hasta
       redirect_to "/alta?"+@data
  end

  # PATCH/PUT /alta/1
  # PATCH/PUT /alta/1.json
  def update
    respond_to do |format|
      if @altum.update(altum_params)
        format.html { redirect_to @altum, notice: 'Altum was successfully updated.' }
        format.json { render :show, status: :ok, location: @altum }
      else
        format.html { render :edit }
        format.json { render json: @altum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alta/1
  # DELETE /alta/1.json
  def destroy
    @altum.destroy
    respond_to do |format|
      format.html { redirect_to alta_url, notice: 'Altum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_altum
      @altum = Altum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def altum_params
      params.require(:altum).permit(:fecha, :cantidad, :plataforma)
    end
end

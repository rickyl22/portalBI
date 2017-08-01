class PublicacionesController < ApplicationController
  before_action :set_publicacion, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, :except => [:create, :new, :show]
  skip_after_action :verify_authorized, only: [:show]

  # GET /publicaciones
  # GET /publicaciones.json
  def index
    @publicaciones = Publicacion.all
    authorize @publicaciones
    @publicaciones = policy_scope(Publicacion)
  end

  # GET /publicaciones/1
  # GET /publicaciones/1.json
  def show
    @publicacion = Publicacion.find(params[:id])
  end

  # GET /publicaciones/new
  def new
    @publicacion = Publicacion.new
    authorize @publicacion
  end

  # GET /publicaciones/1/edit
  def edit
    @publicacion = Publicacion.find(params[:id])
  end

  # POST /publicaciones
  # POST /publicaciones.json
  def create
    @publicacion = Publicacion.new(publicacion_params)
    authorize @publicacion

    respond_to do |format|
      if @publicacion.save
        format.html { redirect_to @publicacion, notice: 'Publicacion creada correctamente.' }
        format.json { render :show, status: :created, location: @publicacion }
      else
        format.html { render :new }
        format.json { render json: @publicacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publicaciones/1
  # PATCH/PUT /publicaciones/1.json
  def update
    respond_to do |format|
      if @publicacion.update(publicacion_params)
        format.html { redirect_to @publicacion, notice: 'Publicacion actualizada correctamente.' }
        format.json { render :show, status: :ok, location: @publicacion }
      else
        format.html { render :edit }
        format.json { render json: @publicacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publicaciones/1
  # DELETE /publicaciones/1.json
  def destroy
    @publicacion.destroy
    respond_to do |format|
      format.html { redirect_to publicaciones_url, notice: 'Publicacion eliminada correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publicacion
      @publicacion = Publicacion.find(params[:id])
      authorize @publicacion
      @publicacion = policy_scope(Publicacion).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publicacion_params
      params.require(:publicacion).permit(:titulo, :descripcion, :imagen, :area)
    end
end

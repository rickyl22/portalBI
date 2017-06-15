class ComentariosController < ApplicationController
  before_action :set_comentario, only: [:show, :edit, :update, :destroy]

  # GET /comentarios
  def index
    @comentarios = Comentario.all
  end

  # GET /comentarios/1
  def show
  end

  # GET /comentarios/new
  def new
    @comentario = Comentario.new
  end

  # GET /comentarios/1/edit
  def edit
  end

  # POST /comentarios
  def create
    
    @caso = Caso.find(params[:comentario][:caso_id])
    if @caso.comentarios.create(comentario_params)
      redirect_to @caso
    else
      render :new
    end
  end

  # PATCH/PUT /comentarios/1
  def update
    if @comentario.update(comentario_params)
      redirect_to @comentario, notice: 'Comentario was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /comentarios/1
  def destroy
    @comentario.destroy
    redirect_to comentarios_url, notice: 'Comentario was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comentario
      @comentario = Comentario.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comentario_params
      params.require(:comentario).permit(:fecha, :texto, :autor, :caso_id)
    end
end

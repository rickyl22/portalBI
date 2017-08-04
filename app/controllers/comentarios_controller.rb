class ComentariosController < ApplicationController
  before_action :set_comentario, only: [:show, :edit, :update, :destroy]
  skip_after_action :verify_policy_scoped
  skip_after_action :verify_authorized


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
      params.require(:comentario).permit(:fecha, :texto, :autor, :caso_id, :role_id, :leido_admin, :leido_cons, :leido_cons_lid)
    end
end

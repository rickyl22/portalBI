class DocumentosController < ApplicationController
  before_action :set_documento, only: [:show, :edit, :update, :destroy]
  skip_after_action :verify_policy_scoped
  skip_after_action :verify_authorized
  # GET /documentos
  # GET /documentos.json
  #def index
    #@documentos = Documento.all
  #end

  # GET /documentos/1
  # GET /documentos/1.json
  #def show
    #authorize @caso
  #end

  # GET /documentos/new
  #def new
    #@documento = Documento.new
  #end

  # GET /documentos/1/edit
  #def edit
  #end

  # POST /documentos
  # POST /documentos.json
  def create
    
    params[:documento][:nombre] = params[:documento][:attachment].original_filename
    p params[:documento][:attachment].original_filename
    @caso = Caso.find(documento_params[:caso_id])
    @documento = Documento.new(documento_params)
      if @documento.save 
        redirect_back(fallback_location:root_path)
      else
        redirect_back(fallback_location:root_path, notice: @documento.errors.messages[:attachment][0]) 
      end
    
  end

  # PATCH/PUT /documentos/1
  # PATCH/PUT /documentos/1.json
  def update
      if @doc.update(documento_params)
        redirect_back(fallback_location:root_path)
      end
  end

  # DELETE /documentos/1
  # DELETE /documentos/1.json
  def destroy
    @doc = Documento.find(params[:id])
    p "yo"
    p @doc.estatus
    @doc.estatus = "Borrado"
    p @doc.estatus
    @doc.save
      redirect_back(fallback_location:root_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_documento
      @documento = Documento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def documento_params
      params.require(:documento).permit(:nombre, :attachment, :estatus, :caso_id)
    end
end

class NoticiaController < ApplicationController
  before_action :set_noticia, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, :except => [:create, :new]
  skip_after_action :verify_authorized

  # GET /noticia
  # GET /noticia.json
  def index
    @noticias = Noticia.all
    authorize @noticias
    @noticias = policy_scope(Kpi)
  end

  # GET /noticia/1
  # GET /noticia/1.json
  def show
    @noticia = Noticia.find(params[:id])
  end

  # GET /noticia/new
  def new
    @noticia = Noticia.new
    authorize @noticia
  end

  # GET /noticia/1/edit
  def edit
    @noticia = Noticia.find(params[:id])
  end

  # POST /noticia
  # POST /noticia.json
  def create
    @noticia = Noticia.new(noticia_params)
    authorize @noticia
    respond_to do |format|
      if @noticia.save
        format.html { redirect_to @noticia, notice: 'Noticium was successfully created.' }
        format.json { render :show, status: :created, location: @noticia }
      else
        format.html { render :new }
        format.json { render json: @noticia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /noticia/1
  # PATCH/PUT /noticia/1.json
  def update
    respond_to do |format|
      if @noticia.update(noticia_params)
        format.html { redirect_to @noticia, notice: 'Noticium was successfully updated.' }
        format.json { render :show, status: :ok, location: @noticia }
      else
        format.html { render :edit }
        format.json { render json: @noticia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /noticia/1
  # DELETE /noticia/1.json
  def destroy
    @noticia.destroy
    respond_to do |format|
      format.html { redirect_to noticia_url, notice: 'Noticium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_noticia
      @noticia = Noticia.find(params[:id])
      authorize @noticia
      @noticia = policy_scope(Noticia).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def noticia_params
      params.require(:noticia).permit(:titulo, :descripcion, :imagen)
    end
end

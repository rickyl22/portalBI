class RecargasTerminalsController < ApplicationController
  before_action :set_recargas_terminal, only: [:show, :edit, :update, :destroy]

  # GET /recargas_terminals
  # GET /recargas_terminals.json
  def index
    @recargas_terminals = RecargasTerminal.all
  end

  # GET /recargas_terminals/1
  # GET /recargas_terminals/1.json
  def show
  end

  # GET /recargas_terminals/new
  def new
    @recargas_terminal = RecargasTerminal.new
  end

  # GET /recargas_terminals/1/edit
  def edit
  end

  # POST /recargas_terminals
  # POST /recargas_terminals.json
  def create
    @recargas_terminal = RecargasTerminal.new(recargas_terminal_params)

    respond_to do |format|
      if @recargas_terminal.save
        format.html { redirect_to @recargas_terminal, notice: 'Recargas terminal was successfully created.' }
        format.json { render :show, status: :created, location: @recargas_terminal }
      else
        format.html { render :new }
        format.json { render json: @recargas_terminal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recargas_terminals/1
  # PATCH/PUT /recargas_terminals/1.json
  def update
    respond_to do |format|
      if @recargas_terminal.update(recargas_terminal_params)
        format.html { redirect_to @recargas_terminal, notice: 'Recargas terminal was successfully updated.' }
        format.json { render :show, status: :ok, location: @recargas_terminal }
      else
        format.html { render :edit }
        format.json { render json: @recargas_terminal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recargas_terminals/1
  # DELETE /recargas_terminals/1.json
  def destroy
    @recargas_terminal.destroy
    respond_to do |format|
      format.html { redirect_to recargas_terminals_url, notice: 'Recargas terminal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recargas_terminal
      @recargas_terminal = RecargasTerminal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recargas_terminal_params
      params.require(:recargas_terminal).permit(:TERMINAL, :FECHA, :CLIENTES, :RECARGAS, :BS_TOTAL, :BS_TOTAL_IVA12, :BS_TOTAL_IVA10, :FISICA, :FISICA_BSF, :FISICA_BSF_SINIVA12, :FISICA_BSF_SINIVA10, :P2P, :P2P_BSF, :P2P_BSF_SINIVA12, :P2P_BSF_SINIVA10, :GRE, :GRE_BSF, :GRE_BSF_SINIVA12, :GRE_BSF_SINIVA10, :BANCARIA, :BANCARIA_BSF, :BANCARIA_BSF_SINIVA12, :BANCARIA_BSF_SINIVA10, :MMO, :MMO_BSF, :MMO_BSF_SINIVA12, :MMO_BSF_SINIVA10, :TRANSFERENCIA, :TRANSFERENCIA_BSF, :TRANSFERENCIA_BSF_SINIVA12, :TRANSFERENCIA_BSF_SINIVA10)
    end
end

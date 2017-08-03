class AltasPlansController < ApplicationController
  before_action :set_altas_plan, only: [:show, :edit, :update, :destroy]
   skip_after_action :verify_policy_scoped
  skip_after_action :verify_authorized
  # GET /altas_plans
  # GET /altas_plans.json
  def index
    @altas_plans = AltasPlan.all
  end

  # GET /altas_plans/1
  # GET /altas_plans/1.json
  def show
  end

  # GET /altas_plans/new
  def new
    @altas_plan = AltasPlan.new
  end

  # GET /altas_plans/1/edit
  def edit
  end

  # POST /altas_plans
  # POST /altas_plans.json
  def create
    @altas_plan = AltasPlan.new(altas_plan_params)

    respond_to do |format|
      if @altas_plan.save
        format.html { redirect_to @altas_plan, notice: 'Altas plan was successfully created.' }
        format.json { render :show, status: :created, location: @altas_plan }
      else
        format.html { render :new }
        format.json { render json: @altas_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /altas_plans/1
  # PATCH/PUT /altas_plans/1.json
  def update
    respond_to do |format|
      if @altas_plan.update(altas_plan_params)
        format.html { redirect_to @altas_plan, notice: 'Altas plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @altas_plan }
      else
        format.html { render :edit }
        format.json { render json: @altas_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /altas_plans/1
  # DELETE /altas_plans/1.json
  def destroy
    @altas_plan.destroy
    respond_to do |format|
      format.html { redirect_to altas_plans_url, notice: 'Altas plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_altas_plan
      @altas_plan = AltasPlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def altas_plan_params
      params.require(:altas_plan).permit(:fecha, :plan, :cantidad, :plataforma)
    end
end

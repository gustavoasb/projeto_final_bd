class HealthConditionsController < ApplicationController
  before_action :set_health_condition, only: [:show, :update, :destroy]

  # GET /health_conditions
  def index
    @health_conditions = HealthCondition.all

    render json: @health_conditions
  end

  # GET /health_conditions/1
  def show
    render json: @health_condition
  end

  # POST /health_conditions
  def create
    @health_condition = HealthCondition.new(health_condition_params)

    if @health_condition.save
      render json: @health_condition, status: :created, location: @health_condition
    else
      render json: @health_condition.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /health_conditions/1
  def update
    if @health_condition.update(health_condition_params)
      render json: @health_condition
    else
      render json: @health_condition.errors, status: :unprocessable_entity
    end
  end

  # DELETE /health_conditions/1
  def destroy
    @health_condition.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_health_condition
      @health_condition = HealthCondition.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def health_condition_params
      params.require(:health_condition).permit(:name, :priority)
    end
end

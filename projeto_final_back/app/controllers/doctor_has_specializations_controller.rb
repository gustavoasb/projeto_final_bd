class DoctorHasSpecializationsController < ApplicationController
  before_action :set_doctor_has_specialization, only: [:show, :update, :destroy]

  # GET /doctor_has_specializations
  def index
    @doctor_has_specializations = DoctorHasSpecialization.all

    render json: @doctor_has_specializations
  end

  # GET /doctor_has_specializations/1
  def show
    render json: @doctor_has_specialization
  end

  # POST /doctor_has_specializations
  def create
    @doctor_has_specialization = DoctorHasSpecialization.new(doctor_has_specialization_params)

    if @doctor_has_specialization.save
      render json: @doctor_has_specialization, status: :created, location: @doctor_has_specialization
    else
      render json: @doctor_has_specialization.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /doctor_has_specializations/1
  def update
    if @doctor_has_specialization.update(doctor_has_specialization_params)
      render json: @doctor_has_specialization
    else
      render json: @doctor_has_specialization.errors, status: :unprocessable_entity
    end
  end

  # DELETE /doctor_has_specializations/1
  def destroy
    @doctor_has_specialization.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor_has_specialization
      @doctor_has_specialization = DoctorHasSpecialization.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def doctor_has_specialization_params
      params.require(:doctor_has_specialization).permit(:doctor_crm, :specialization_id)
    end
end

class EntryHasSymptomsController < ApplicationController
  before_action :set_entry_has_symptom, only: [:show, :update, :destroy]

  # GET /entry_has_symptoms
  def index
    @entry_has_symptoms = EntryHasSymptom.all

    render json: @entry_has_symptoms
  end

  # GET /entry_has_symptoms/1
  def show
    render json: @entry_has_symptom
  end

  # POST /entry_has_symptoms
  def create
    @entry_has_symptom = EntryHasSymptom.new(entry_has_symptom_params)

    if @entry_has_symptom.save
      render json: @entry_has_symptom, status: :created, location: @entry_has_symptom
    else
      render json: @entry_has_symptom.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /entry_has_symptoms/1
  def update
    if @entry_has_symptom.update(entry_has_symptom_params)
      render json: @entry_has_symptom
    else
      render json: @entry_has_symptom.errors, status: :unprocessable_entity
    end
  end

  # DELETE /entry_has_symptoms/1
  def destroy
    @entry_has_symptom.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry_has_symptom
      @entry_has_symptom = EntryHasSymptom.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def entry_has_symptom_params
      params.require(:entry_has_symptom).permit(:entry_id, :symptom_id)
    end
end

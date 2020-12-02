class AttendantsController < ApplicationController
  before_action :set_attendant, only: [:show, :update, :destroy]

  # GET /attendants
  def index
    data = Attendant.all.map do |attendant|
      {name: attendant.name, cpf: CPF.new(attendant.cpf).formatted, birth_date: attendant.birth_date.strftime("%d/%m/%Y"), hiring_date: attendant.hiring_date.strftime("%d/%m/%Y"), unit_id: attendant.unit_id}
    end
  render json: data, status: :ok
  end

  # GET /attendants/1
  def show
    data = {name: @attendant.name, cpf: CPF.new(@attendant.cpf).formatted, birth_date: @attendant.birth_date.strftime("%d/%m/%Y"), hiring_date: @attendant.hiring_date.strftime("%d/%m/%Y"), unit_id: @attendant.unit_id}
    render json: data, status: :ok
  end

  # POST /attendants
  def create
    @attendant = Attendant.new(attendant_params)

    if @attendant.save
      render json: @attendant, status: :created, location: @attendant
    else
      render json: @attendant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /attendants/1
  def update
    if @attendant.update(attendant_params)
      render json: @attendant, status: :ok
    else
      render json: @attendant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /attendants/1
  def destroy
    @attendant.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendant
      @attendant = Attendant.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def attendant_params
      params.require(:attendant).permit(:cpf, :name, :birth_date, :hiring_date, :unit_id)
    end
end

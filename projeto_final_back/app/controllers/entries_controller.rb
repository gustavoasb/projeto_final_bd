class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :update, :destroy]

  # GET /entries
  def index
    data = Entry.all.map do |entry| 
      {id: entry.id, user_cpf: CPF.new(entry.user_cpf).formatted, doctor_crm: entry.doctor_crm, arrival_time: entry.arrival_time.strftime("%d/%m/%Y %H:%M"), was_attended: entry.was_attended, health_condition_id: entry.health_condition_id}
    end
    render json: data, status: :ok
  end

  # GET /entries/1
  def show
    data = {id: @entry.id, user_cpf: CPF.new(@entry.user_cpf).formatted, doctor_crm: @entry.doctor_crm, arrival_time: @entry.arrival_time.strftime("%d/%m/%Y %H:%M"), was_attended: @entry.was_attended, health_condition_id: @entry.health_condition_id}

    render json: data, status: :ok
  end

  # POST /entries
  def create
    @entry = Entry.new(entry_params)
    # @entry.arrival_time = Time.now
    
    if @entry.save
      EntryMailer.with(user: @entry.user, entry: @entry, doctor: @entry.doctor, health_condition: @entry.health_condition).create_entry.deliver_later
      render json: @entry, status: :created, location: @entry
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /entries/1
  def update
    if @entry.update(entry_params)
      render json: @entry, status: :ok
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /entries/1
  def destroy
    @entry.destroy
  end

  # POST /entry_notification/
  def send_notification
    @entry = Entry.find(params[:entry_id])
    EntryMailer.with(user: @entry.user, entry: @entry, doctor: @entry.doctor, health_condition: @entry.health_condition).chamado_para_atendimento.deliver_later
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def entry_params
      params.require(:entry).permit(:was_attended, :arrival_time, :user_cpf, :doctor_crm, :health_condition_id)
    end
end

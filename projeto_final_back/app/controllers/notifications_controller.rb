class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :update, :destroy]

  # GET /notifications
  def index
    data = Notification.all.map do |notification|
      {id: notification.id, message: notification.message, sent_at: notification.sent_at.strftime("%d/%m/%Y %H:%M"), user_cpf: CPF.new(notification.user_cpf).formatted, entry_id: notification.entry_id}
    end
    render json: data
  end

  # GET /notifications/1
  def show
    data = {id: @notification.id, message: @notification.message, sent_at: @notification.sent_at.strftime("%d/%m/%Y %H:%M"), user_cpf: CPF.new(@notification.user_cpf).formatted, entry_id: @notification.entry_id}
    
    render json: data
  end

  # POST /notifications
  def create
    @notification = Notification.new(notification_params)
    @notification.sent_at = Time.now
    
    if @notification.save
      render json: @notification, status: :created, location: @notification
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notifications/1
  def update
    if @notification.update(notification_params)
      render json: @notification
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notifications/1
  def destroy
    @notification.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def notification_params
      params.require(:notification).permit(:message, :sent_at, :user_cpf, :entry_id)
    end
end

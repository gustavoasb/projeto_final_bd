class EntryMailer < ApplicationMailer
    default from: 'notifications@example.com'
 
    def create_entry
        @user = params[:user]
        @health_condition = params[:health_condition]
        @doctor = params[:doctor]
        @entry = params[:entry]
        @not = Notification.new(entry: @entry, user: @user, sent_at: Time.now, message: "Entrada registrada com sucesso")
        @not.save
        mail(to: @user.email, subject: 'Entrada registrada')
    end

    def chamado_para_atendimento
        @user = params[:user]
        @health_condition = params[:health_condition]
        @doctor = params[:doctor]
        @entry = params[:entry]
        @not = Notification.new(entry: @entry, user: @user, sent_at: Time.now, message: "Apresente-se na sala de atendimento")
        @not.save
        mail(to: @user.email, subject: 'Estamos te aguardando')
    end
end

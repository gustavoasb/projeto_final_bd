# Preview all emails at http://localhost:3000/rails/mailers/entry_mailer
class EntryMailerPreview < ActionMailer::Preview
    def create_entry
        @entry = Entry.first
        EntryMailer.with(user: @entry.user, entry: @entry, doctor: @entry.doctor, health_condition: @entry.health_condition).create_entry
    end

    def chamado_para_atendimento
        @entry = Entry.first
        EntryMailer.with(user: @entry.user, entry: @entry, doctor: @entry.doctor, health_condition: @entry.health_condition).chamado_para_atendimento
    end
end

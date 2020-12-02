class Notification < ApplicationRecord
  belongs_to :entry, optional: true
  belongs_to :user, foreign_key: 'user_cpf'
  validates :message, presence: true
  validates :sent_at, presence: true
end

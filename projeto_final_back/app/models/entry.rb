class Entry < ApplicationRecord
  belongs_to :health_condition
  belongs_to :doctor, foreign_key: 'doctor_crm'
  belongs_to :user, foreign_key: 'user_cpf'
  has_many :notifications
  has_many :entry_has_symptoms
  has_many :symptoms, :through => :entry_has_symptoms

  validates :was_attended, presence: true
  validates :arrival_time, presence: true
end

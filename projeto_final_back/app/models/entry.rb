class Entry < ApplicationRecord
  belongs_to :health_condition
  belongs_to :doctor
  belongs_to :user
  has_many :notifications
  has_many :symptoms, :through => :entry_has_symptoms
  has_many :symptoms
end
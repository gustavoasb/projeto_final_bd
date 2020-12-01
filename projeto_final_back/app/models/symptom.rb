class Symptom < ApplicationRecord
    has_many :entries, :through => :entry_has_symptoms
    has_many :entries
    validates :name, presence: true, uniqueness: true
end

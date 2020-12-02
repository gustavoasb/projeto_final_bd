class Symptom < ApplicationRecord
    has_many :entries, :through => :entry_has_symptoms
    validates :name, presence: true, uniqueness: true
end

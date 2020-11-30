class Symptom < ApplicationRecord
    has_many :entries, :through => :entry_has_symptom
    has_many :entries
end

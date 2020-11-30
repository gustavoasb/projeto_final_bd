class EntryHasSymptom < ApplicationRecord
  belongs_to :entry
  belongs_to :symptom
end

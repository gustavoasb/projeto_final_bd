class Entry < ApplicationRecord
  belongs_to :health_condition
  has_many :symptom, :through => :entry_has_symptom
  has_many :symptom
end

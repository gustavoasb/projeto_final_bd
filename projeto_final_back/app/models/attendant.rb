class Attendant < ApplicationRecord
  belongs_to :unit
  validates :name, presence: true
  validates :hiring_date, presence: true
  validates :birth_date, presence: true
end

class Unit < ApplicationRecord
  belongs_to :hospital
  belongs_to :address
  has_many :attendants
  has_many :doctors
  validates :name, presence: true
end

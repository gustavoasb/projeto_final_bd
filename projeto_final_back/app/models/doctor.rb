class Doctor < ApplicationRecord
  belongs_to :unit
  has_many :specializations, :through => :doctor_has_specializations
  has_many :specializations
  has_many :entries
  validates :name, presence: true
  validates :room, presence: true
end

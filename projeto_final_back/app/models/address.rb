class Address < ApplicationRecord
  belongs_to :district
  has_one :unit
  validates :street, presence: true
  validates :number, presence: true
  validates :cep, presence: true
end

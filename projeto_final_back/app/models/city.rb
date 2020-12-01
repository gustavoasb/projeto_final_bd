class City < ApplicationRecord
  belongs_to :uf
  has_many :districts
  validates :name, presence: true
end

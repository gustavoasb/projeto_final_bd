class Hospital < ApplicationRecord
    has_many :units
    validates :name, presence: true, uniqueness: true
    validates :abbreviation, presence: true
end

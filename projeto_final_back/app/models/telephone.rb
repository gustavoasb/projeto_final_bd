class Telephone < ApplicationRecord
    has_one :user
    validates :home_phone, presence: true
    validates :cell_phone, presence: true
end

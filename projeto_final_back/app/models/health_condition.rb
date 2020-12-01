class HealthCondition < ApplicationRecord
    has_one :entry
    validates :name, presence: true, uniqueness: true
    validates :priority, presence: true
end

class Specialization < ApplicationRecord
    has_many :doctors, through: :doctor_has_specializations
    validates :name, presence: true, uniqueness: true
end

class Specialization < ApplicationRecord
    has_many :doctors, through: :doctor_has_specializations
    has_many :doctors
    validates :name, presence: true, uniqueness: true
end

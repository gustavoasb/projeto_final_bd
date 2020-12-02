class Specialization < ApplicationRecord
    has_many :doctor_has_specializations
    has_many :doctors, through: :doctor_has_specializations
    validates :name, presence: true, uniqueness: true
end

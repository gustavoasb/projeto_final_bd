class DoctorHasSpecialization < ApplicationRecord
  belongs_to :specialization
  belongs_to :doctor
end

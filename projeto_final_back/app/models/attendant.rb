class Attendant < ApplicationRecord
  belongs_to :unit
  validates :name, presence: true
  validates :hiring_date, presence: true
  validates :birth_date, presence: true
  
  validate :cpf_validation

  def cpf_validation
    if not(CPF.valid?(cpf))
        errors.add(:cpf, 'CPF invalido') unless cpf.blank?
    else
        return true
    end
  end
end

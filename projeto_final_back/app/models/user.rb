class User < ApplicationRecord
  has_many :notifications
  has_many :entries
  belongs_to :telephone
  validates :birth_date, presence: true
  validates :name, presence: true
  validates :email, presence: true

  validate :cpf_validation

  def cpf_validation
    if not(CPF.valid?(cpf))
        errors.add(:cpf, 'CPF invalido') unless cpf.blank?
    else
        return true
    end
  end
end

class User < ApplicationRecord
  has_many :notifications
  has_many :entries
  belongs_to :telephone
  validates :birth_date, presence: true
  validates :name, presence: true
  validates :email, presence: true
end

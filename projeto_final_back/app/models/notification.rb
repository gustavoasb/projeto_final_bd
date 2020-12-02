class Notification < ApplicationRecord
  belongs_to :entry, optional: true
  belongs_to :user
  validates :message, presence: true
  validates :sent_at, presence: true
end

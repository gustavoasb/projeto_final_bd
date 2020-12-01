class Notification < ApplicationRecord
  belongs_to :entry, optional: true
  belongs_to :user
  presence :message, presence: true
end

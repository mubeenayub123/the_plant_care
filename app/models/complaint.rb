class Complaint < ApplicationRecord
  belongs_to :user
  belongs_to :irrigation_system

  validates :title, presence: true

  enum status:  {
    completed: 1,
    pending: 0,
    closed: -1
  }
end

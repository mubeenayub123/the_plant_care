class IrrigationSystem < ApplicationRecord
  belongs_to :user
  has_many :plant_data
end

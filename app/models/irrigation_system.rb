# frozen_string_literal: true

class IrrigationSystem < ApplicationRecord
  belongs_to :user
  has_many :plant_data
  has_many :irrigation_system_plants
end

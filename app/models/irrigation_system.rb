# frozen_string_literal: true

class IrrigationSystem < ApplicationRecord
  belongs_to :user
  has_many :plant_data
  has_many :irrigation_system_plants
  has_many :complaints

  validates :uuid, uniqueness: true
end

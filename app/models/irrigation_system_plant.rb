# frozen_string_literal: true

class IrrigationSystemPlant < ApplicationRecord
  belongs_to :irrigation_system
  belongs_to :plant
end

# frozen_string_literal: true

class Plant < ApplicationRecord
  has_many :irrigation_system_plants
  belongs_to :plant_category
end

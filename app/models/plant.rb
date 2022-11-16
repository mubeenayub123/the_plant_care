# frozen_string_literal: true

class Plant < ApplicationRecord
  has_many :irrigation_system_plants
end

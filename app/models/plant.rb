# frozen_string_literal: true

class Plant < ApplicationRecord
  has_many :irrigation_system_plants
  belongs_to :plant_category

  has_one_attached :primary_image
  has_one_attached :secondary_image

end

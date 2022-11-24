# frozen_string_literal: true

class SoilMoistureDatum < ApplicationRecord
  PREDITCION_ENDPOINT = 'https://plant-preditcion.herokuapp.com/predict'
  WATER_PER_SECOND = 15
  MOISTURE_INCREASE_PER_SECOND = 7.5
  belongs_to :plant_datum

  after_create :calculate_water_requirement


  def calculate_water_requirement
    prediction = MachineLearning::Prediction.new(moisture_data: self).predict
    self.update prediction: prediction

    water_requirement = MachineLearning::WaterQuantityCalculator.new(moisture_data: self).calculate
    self.update water_pump: water_requirement
  end
end

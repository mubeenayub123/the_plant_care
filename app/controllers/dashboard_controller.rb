require 'json'
class DashboardController < ApplicationController
  before_action :set_objects, only: %i[index]

  def index
      # Rendering the widget
    @temprature_chart = Charts::TemperatureChart.new(plant_data: @plant_data).generate
    @moisture_charts = @plant_data.soil_moisture_data.map do |moisture_data|
      Charts::MoistureChart.new(moisture_data: moisture_data).generate
    end
    @humidity_chart = Charts::HumidityChart.new(plant_data: @plant_data).generate
    @light_intensity_chart = Charts::LightIntensityChart.new(plant_data: @plant_data).generate
    @water_level_chart = Charts::WaterLevelChart.new(plant_data: @plant_data).generate
  end

  def set_objects
    @irrigation_system = IrrigationSystem.find(params[:id])
    @plant_data  = @irrigation_system.plant_data.last
  end
end

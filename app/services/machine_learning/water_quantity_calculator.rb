class MachineLearning::WaterQuantityCalculator
  attr_reader :moisture_data

  delegate :plant_datum, :prediction, :value, :sensor_no, to: :moisture_data
  delegate :humidity, :temprature, :light_intensity, to: :plant_datum

  def initialize(moisture_data:)
    @moisture_data = moisture_data
  end

  def calculate
    return 0 unless ideal_moisture_level.present?

    (((temprature - prediction)*(ideal_moisture_level - value))/15)/SoilMoistureDatum::WATER_PER_SECOND
  end

  def ideal_moisture_level
    moisture_data.plant_datum&.irrigation_system&.irrigation_system_plants&.where(sensor_no: sensor_no)&.first&.plant&.required_soil_moisture
  end
end

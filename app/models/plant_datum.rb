# frozen_string_literal: true

class PlantDatum < ApplicationRecord
  belongs_to :irrigation_system
  has_many :soil_moisture_data
  after_create_commit :send_alert_email, if: :water_level_low?

  def self.csv
    CSV.generate do |csv|
      csv << %w[humidity light_intensity temprature irrigation_system_id value_1 pump_1 value_2
                pump_2]
      all.each do |s|
        sensor1 = s.soil_moisture_data.where(sensor_no: 1).first
        sensor2 = s.soil_moisture_data.where(sensor_no: 2).first
        csv << [s.humidity, s.light_intensity, s.temprature, s.irrigation_system_id, sensor1&.value,
                sensor1&.water_pump, sensor2&.value, sensor2&.water_pump]
      end
    end
  end

  def send_alert_email
    AlertMailer.with(plant_data: self).new_alert_email.deliver_later
  end

  def water_level_low?
    self.water_level < 100
  end
end

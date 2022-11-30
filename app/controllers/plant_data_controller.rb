# frozen_string_literal: true

class PlantDataController < ApplicationController
  skip_before_action :authenticate_user!, except: %w[index]
  skip_before_action :verify_authenticity_token, except: %w[index]

  def index
    @plant_data = PlantDatum.last(10).reverse
  end

  def create
    irrigation_system = IrrigationSystem.find_by(uuid: plant_data_params[:irrigation_system_uuid])
    plant_data = PlantDatum.create(
      humidity: plant_data_params[:humidity],
      temprature: plant_data_params[:temprature],
      light_intensity: plant_data_params[:light_intensity],
      water_level: plant_data_params[:water_level],
      irrigation_system: irrigation_system
    )

    moisture_data_1 = SoilMoistureDatum.create(
      value: plant_data_params[:value_1],
      water_pump: plant_data_params[:pump_1],
      sensor_no: 1,
      plant_datum: plant_data
    )
    moisture_data_2 = SoilMoistureDatum.create(
      value: plant_data_params[:value_2],
      water_pump: plant_data_params[:pump_2],
      sensor_no: 2,
      plant_datum: plant_data
    )

    render json: { water_pump_1: moisture_data_1.water_pump, water_pump_2: moisture_data_2.water_pump }
  end

  def export
    send_data PlantDatum.csv, filename: "plant-data-#{Time.now}.csv", type: 'application/csv', disposition: 'attachment'
  end

  def plant_data_params
    params.require(:plant_data).permit(:humidity, :temprature, :light_intensity, :irrigation_system_uuid, :value_1,
                                       :value_2, :pump_1, :pump_2, :water_level)
  end
end

class PlantDataController < ApplicationController
  skip_before_action :authenticate_user!, except: %w[index]
  skip_before_action :verify_authenticity_token, except: %w[index]

  def index
    @plant_data = PlantDatum.all
  end

  def create
    plant_data = PlantDatum.create(plant_data_params)
    irrigation_system = IrrigationSystem.find_by(uuid: params[:plant_data][:irrigation_system_uuid])
    plant_data.update irrigation_system: irrigation_system
  end

  def plant_data_params
    params.require(:plant_data).permit(:soil_moisture, :humidity, :temprature, :solenoid_walve, :light_intensity)
  end
end

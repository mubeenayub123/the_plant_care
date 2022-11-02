class PlantDataController < ApplicationController
  skip_before_action :authenticate_user!, except: %w[index]
  skip_before_action :verify_authenticity_token, except: %w[index]

  def index
    @plant_data = PlantDatum.last(10).reverse
  end

  def create
    irrigation_system = IrrigationSystem.find_by(uuid: plant_data_params[:irrigation_system_uuid])
    plant_data = PlantDatum.create(
      soil_moisture: plant_data_params[:soil_moisture],
      humidity: plant_data_params[:humidity],
      temprature: plant_data_params[:temprature],
      light_intensity: plant_data_params[:light_intensity],
      solenoid_walve: plant_data_params[:solenoid_walve],
      irrigation_system: irrigation_system
    )
  end

  def export
    send_data PlantDatum.csv, filename: "plant-data-#{Time.now}.csv", type: "application/csv", disposition: 'attachment'
  end

  def plant_data_params
    params.require(:plant_data).permit(:soil_moisture, :humidity, :temprature, :solenoid_walve, :light_intensity, :irrigation_system_uuid)
  end
end

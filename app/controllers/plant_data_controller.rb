class PlantDataController < ApplicationController
  skip_before_action :authenticate_user!, except: %w[index]
  skip_before_action :verify_authenticity_token, except: %w[index]

  def index
    @plant_data = PlantDatum.all
  end

  def create
    plant_data = PlantDatum.create(
      soil_moisture: plant_data_params[:soil_moisture],
      humidity: plant_data_params[:humidity],
      temprature: plant_data_params[:temprature],
      light_intensity: plant_data_params[:light_intensity],
      solenoid_walve: plant_data_params[:solenoid_walve],
    )

    puts 'klsajdkladsjkldajskldsajkldsajkldsakjldsakljdsakjldsakjldsakjlsadkljadskjl'
    puts plant_data
    puts plant_data.errors.full_messages
    irrigation_system = IrrigationSystem.find_by(uuid: plant_data_params[:irrigation_system_uuid])
    plant_data.update irrigation_system: irrigation_system
  end

  def plant_data_params
    params.require(:plant_data).permit(:soil_moisture, :humidity, :temprature, :solenoid_walve, :light_intensity, :irrigation_system_uuid)
  end
end

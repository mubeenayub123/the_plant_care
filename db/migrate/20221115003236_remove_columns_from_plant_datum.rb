class RemoveColumnsFromPlantDatum < ActiveRecord::Migration[7.0]
  def change
    remove_column :plant_data, :solenoid_walve
    remove_column :plant_data, :soil_moisture
  end
end

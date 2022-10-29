class CreatePlantData < ActiveRecord::Migration[7.0]
  def change
    create_table :plant_data do |t|
      t.decimal :humidity
      t.decimal :light_intensity
      t.decimal :temprature
      t.decimal :soil_moisture
      t.decimal :solenoid_walve
      t.integer :irrigation_system_id

      t.timestamps
    end
  end
end

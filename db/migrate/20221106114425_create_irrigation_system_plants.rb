class CreateIrrigationSystemPlants < ActiveRecord::Migration[7.0]
  def change
    create_table :irrigation_system_plants do |t|
      t.integer :irrigation_system_id
      t.integer :plant_id
      t.integer :sensor_no

      t.timestamps
    end
  end
end

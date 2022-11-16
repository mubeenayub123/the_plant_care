class CreateSoilMoistureData < ActiveRecord::Migration[7.0]
  def change
    create_table :soil_moisture_data do |t|
      t.decimal :value
      t.decimal :prediction
      t.integer :sensor_no
      t.decimal :water_pump
      t.integer :plant_datum_id

      t.timestamps
    end
  end
end

class AddWaterLevelToPlantData < ActiveRecord::Migration[7.0]
  def change
    add_column :plant_data, :water_level, :integer
  end
end

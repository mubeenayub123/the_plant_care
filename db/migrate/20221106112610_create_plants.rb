class CreatePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.decimal :required_soil_moisture

      t.timestamps
    end
  end
end

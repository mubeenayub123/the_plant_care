class CreateIrrigationSystems < ActiveRecord::Migration[7.0]
  def change
    create_table :irrigation_systems do |t|
      t.string :uuid

      t.timestamps
    end
  end
end

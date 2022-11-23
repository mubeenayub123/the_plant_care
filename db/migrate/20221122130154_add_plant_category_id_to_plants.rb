class AddPlantCategoryIdToPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :plants, :plant_category_id, :integer
  end
end

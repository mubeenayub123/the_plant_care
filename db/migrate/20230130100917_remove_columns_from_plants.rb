class RemoveColumnsFromPlants < ActiveRecord::Migration[7.0]
  def change
    remove_column :plants, :image_name
    remove_column :plants, :main_image
  end
end

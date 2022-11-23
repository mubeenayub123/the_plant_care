class AddDescriptionToPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :plants, :description, :text
    add_column :plants, :image_name, :string
  end
end

class AddMainImageToPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :plants, :main_image, :string
  end
end

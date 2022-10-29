class AddUserIdToIrrigationSystem < ActiveRecord::Migration[7.0]
  def change
    add_column :irrigation_systems, :user_id, :integer
  end
end

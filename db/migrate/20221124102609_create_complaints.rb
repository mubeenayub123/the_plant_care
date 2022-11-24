class CreateComplaints < ActiveRecord::Migration[7.0]
  def change
    create_table :complaints do |t|
      t.string :title
      t.text :description
      t.integer :status
      t.integer :user_id
      t.integer :irrigation_system_id

      t.timestamps
    end
  end
end

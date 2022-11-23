class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :province, :string
    add_column :users, :postcode, :string
    add_column :users, :country_code, :string
    add_column :users, :phone_number, :string
    add_column :users, :gender, :string
    remove_column :users, :name, :string
  end
end

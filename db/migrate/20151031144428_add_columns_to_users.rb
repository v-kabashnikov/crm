class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :phone, :string
    add_reference :users, :speciality, index: true, foreign_key: true
    add_column :users, :skype, :string
    add_column :users, :city, :string
    add_column :users, :role, :string
  end
end

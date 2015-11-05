class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :client_id
      t.references :worktype, index: true, foreign_key: true
      t.string :wortype_other
      t.references :speciality, index: true, foreign_key: true
      t.string :speciality_other
      t.string :institution
      t.string :theme
      t.string :uniqueness
      t.attachment :document
      t.text :comment
      t.date :deadline      
      t.integer :page_number

      t.integer :manager_id
      t.integer :employee_id      
      t.datetime :employee_deadline
      t.datetime :inform_date
      t.integer :status
      t.integer :price

      t.timestamps null: false
    end
    add_foreign_key :orders, :users, column: :client_id
    add_foreign_key :orders, :users, column: :manager_id
    add_foreign_key :orders, :users, column: :employee_id
  end
end

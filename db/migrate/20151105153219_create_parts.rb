class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name
      t.datetime :deadline
      t.references :order, index: true, foreign_key: true
      t.text :description
      t.attachment :file
      t.integer :status

      t.timestamps null: false
    end
  end
end

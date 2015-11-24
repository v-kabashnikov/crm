class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :content
      t.string :link
      t.string :string

      t.timestamps null: false
    end
  end
end

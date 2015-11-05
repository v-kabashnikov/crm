class CreateWorktypes < ActiveRecord::Migration
  def change
    create_table :worktypes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

class AddUserIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :user_id, :integer, default: false, null: false
    add_column :events, :type, :string, default: false, null: false
  end
end

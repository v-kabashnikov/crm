class AddDefaultValueToPartStatus < ActiveRecord::Migration
  def change
    change_column_default :parts, :status, 0
  end
end

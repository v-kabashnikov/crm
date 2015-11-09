class FixColumnNameInOrder < ActiveRecord::Migration
  def change
    rename_column :orders, :wortype_other, :worktype_other
  end
end

class ChangeColumnUserididToUseridFromLists < ActiveRecord::Migration
  def change
    remove_column :lists, :user_id_id

    add_column :lists, :user_id, :integer
    add_index :lists, :user_id
  end
end

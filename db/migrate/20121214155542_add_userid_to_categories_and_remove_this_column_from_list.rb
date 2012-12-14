class AddUseridToCategoriesAndRemoveThisColumnFromList < ActiveRecord::Migration
  def change
    remove_column :lists, :user_id
    add_column :categories, :user_id, :integer
    add_index :categories, :user_id
  end
end

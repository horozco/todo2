class RemoveCategoryidFromTaskAndAddThisToList < ActiveRecord::Migration
  def change
    remove_column :tasks, :category_id
    add_column :lists, :category_id, :integer
    add_index :lists, :category_id
  end
end

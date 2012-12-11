class AddTaskIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :task_id, :integer
    add_index :categories, :task_id
  end
end

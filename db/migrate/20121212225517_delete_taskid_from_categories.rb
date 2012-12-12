class DeleteTaskidFromCategories< ActiveRecord::Migration
  def change
    remove_column :categories, :task_id
  end
end

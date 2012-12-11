class RemoveCategoryIdFromReminders < ActiveRecord::Migration
  def change
    remove_column :reminders, :category_id
  end
end

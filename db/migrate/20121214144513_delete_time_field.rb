class DeleteTimeField < ActiveRecord::Migration
  def change
  	remove_column :reminders, :time
  	remove_column :reminders, :date
  	add_column :reminders, :date_time, :date
  end
end

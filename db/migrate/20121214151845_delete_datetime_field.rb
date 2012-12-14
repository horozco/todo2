class DeleteDatetimeField < ActiveRecord::Migration
  def change
  	remove_column :reminders, :date_time
  	add_column :reminders, :date_time, :datetime
  end
end

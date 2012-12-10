class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.references :task
      t.string :date
      t.string :time
      t.string :repeat, default: '0000000'
      t.string :location
      t.references :category

      t.timestamps
    end
    add_index :reminders, :task_id
    add_index :reminders, :category_id
  end
end

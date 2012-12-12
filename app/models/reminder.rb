class Reminder < ActiveRecord::Base
  attr_accessible :date, :location, :repeat, :time, :task_id
  validates_presence_of :time
  validates :task_id, uniqueness: true, presence: true
end

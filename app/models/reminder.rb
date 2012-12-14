class Reminder < ActiveRecord::Base
  attr_accessible :date_time, :location, :repeat, :task_id
  belongs_to :task
  validates_presence_of :date_time
  validates :task_id, uniqueness: true, presence: true
  
end

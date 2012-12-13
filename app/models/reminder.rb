class Reminder < ActiveRecord::Base
  attr_accessible :date, :location, :repeat, :time, :task_id
  belongs_to :task
  validates_presence_of :time
  validates :task_id, uniqueness: true, presence: true
end

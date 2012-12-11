class Reminder < ActiveRecord::Base
  belongs_to :task
  attr_accessible :date, :location, :repeat, :time
end

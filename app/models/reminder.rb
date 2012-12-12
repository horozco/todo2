class Reminder < ActiveRecord::Base
  attr_accessible :date, :location, :repeat, :time
  validates_presence_of :time
end

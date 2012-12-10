class Reminder < ActiveRecord::Base
  belongs_to :task
  belongs_to :category
  attr_accessible :date, :location, :repeat, :time
end

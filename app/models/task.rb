class Task < ActiveRecord::Base
  attr_accessible :name, :status
  belongs_to :list
  validates_presence_of :name
  has_one :reminder
  has_one :category
  scope :completed, where(:status => true)
  scope :incompleted, where(:status => false)

end

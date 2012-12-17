class Task < ActiveRecord::Base
  attr_accessible :name, :status, :reminders_attributes
  belongs_to :list
  validates_presence_of :name
  has_many :reminders, dependent: :destroy
  scope :completed, where(:status => true)
  scope :incompleted, where(:status => false)
  accepts_nested_attributes_for :reminders
end

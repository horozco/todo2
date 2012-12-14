class List < ActiveRecord::Base
  attr_accessible :title, :description, :user_id, :category_id, :tasks_attributes
  validates_presence_of :title, :category_id

  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks

  belongs_to :category
<<<<<<< HEAD
=======

  belongs_to :user
  
>>>>>>> Fixed Reminders Modal
end

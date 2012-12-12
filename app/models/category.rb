class Category < ActiveRecord::Base
  attr_accessible :name_category, :task_id
  validates :name_category, uniqueness: true, presence: true
  validates_uniqueness_of :task_id
end

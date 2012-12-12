class Category < ActiveRecord::Base
  attr_accessible :name_category, :task_id
  validates :name_category, uniqueness: true, presence: true
  validates :task_id, uniqueness: true, presence: true
end

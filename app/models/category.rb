class Category < ActiveRecord::Base
  attr_accessible :name_category
  belongs_to :task
end

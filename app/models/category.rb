class Category < ActiveRecord::Base
  attr_accessible :name_category
  validates :name_category, uniqueness: true, presence: true
end

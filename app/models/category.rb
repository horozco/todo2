class Category < ActiveRecord::Base
  attr_accessible :name_category
  
  validates_presence_of :name_category

  validates_uniqueness_of :name_category, :scope => :user_id
  
  belongs_to :user
  
  has_many :lists, dependent: :destroy

  def get_name
    return name_category
  end
end
class Category < ActiveRecord::Base
  attr_accessible :name_category
  
  validates :name_category, uniqueness: true, presence: true
  
  belongs_to :user
  
  has_many :lists, dependent: :destroy

  def get_name
    return name_category
  end
end
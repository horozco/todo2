class Category < ActiveRecord::Base
  attr_accessible :name_category
  validates :name_category, uniqueness: true, presence: true

  def get_name
    return name_category
  end

  has_many :lists, dependent: :destroy
end
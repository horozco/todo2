class List < ActiveRecord::Base
  attr_accessible :title, :description, :user_id, :category_id
  validates_presence_of :title, :category_id

  has_many :tasks, dependent: :destroy

  belongs_to :category
end

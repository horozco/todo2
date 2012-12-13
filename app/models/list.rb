class List < ActiveRecord::Base
  attr_accessible :title, :description, :user_id, :category_id
  validates_presence_of :title

  has_many :tasks, dependent: :destroy

  has_many :tasks
  has_one :category

  belongs_to :user
end

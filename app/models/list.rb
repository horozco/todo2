class List < ActiveRecord::Base
  attr_accessible :title, :description, :user_id, :category_id
  validates_presence_of :title
<<<<<<< HEAD
  has_many :tasks, dependent: :destroy
=======
  has_many :tasks
  has_one :category
>>>>>>> Change Categories
  belongs_to :user
end

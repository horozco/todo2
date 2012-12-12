class List < ActiveRecord::Base
  attr_accessible :title, :description, :user_id
  validates_presence_of :title
  has_many :tasks
  belongs_to :user
end

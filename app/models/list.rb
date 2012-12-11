class List < ActiveRecord::Base
  attr_accessible :title, :description, :user_id
  belogns_to :user
end

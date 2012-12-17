require 'spec_helper'

describe Category do
  it {should validate_presence_of(:name_category)}
  it {should validate_uniqueness_of(:name_category).scoped_to(:user_id)}
  it {should belong_to (:user)} 
  it {should have_many(:lists).dependent(:destroy)} 
end

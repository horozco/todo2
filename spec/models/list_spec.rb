require 'spec_helper'

describe List do
  it {should validate_presence_of(:title) }
  it {should validate_presence_of(:category_id) }
  it {should have_many(:tasks).dependent(:destroy)}
  it {should accept_nested_attributes_for(:tasks)}
  it {should belong_to(:category)}
end
require 'spec_helper'

describe Category do
  it {should validate_presence_of(:name_category)}
  it {should validate_uniqueness_of(:name_category)}
end

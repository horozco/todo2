require 'spec_helper'

describe Reminder do
  it {should have_one(:category)}
  it {should validate_presence_of(:time)}
end

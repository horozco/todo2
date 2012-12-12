require 'spec_helper'

describe Reminder do
  it {should validate_presence_of(:time)}
end

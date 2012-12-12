require 'spec_helper'

describe Reminder do
  it {should validate_presence_of(:time)}
  it {should validate_uniqueness_of(:task_id)}
  it {should validate_presence_of(:task_id)}
end

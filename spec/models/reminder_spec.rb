require 'spec_helper'

describe Reminder do
  it {should validate_uniqueness_of(:task_id)}
  it {should validate_presence_of(:task_id)}
  it {should validate_presence_of(:date_time)}
  it {should belong_to(:task)}
end
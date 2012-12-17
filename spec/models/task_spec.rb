require 'spec_helper'

describe Task do
  it {should validate_presence_of(:name)}
  it {should belong_to(:list)}
  it {should have_many(:reminders).dependent(:destroy)}
  it {should accept_nested_attributes_for(:reminders)}
  
  describe Task, "completed" do
    it "should include tasks with a status flag" do
      complete = create(:task, name: "a task name", status: true)
      Task.completed.should include(complete)
    end
  end
  describe Task, "incompleted" do
    it "should include tasks without a status flag" do
      complete = create(:task, name: "a task name", status: false)
      Task.incompleted.should include(complete)
    end
  end
end

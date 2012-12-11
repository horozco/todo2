require 'spec_helper'

describe RemindersController do
  before(:all) do
    @existing_task = create(:task)
  end

  it "should allow to create a new reminder to a given task. Should show the list page with a flash notice message" do
    expect {
      post :create, {
        task_id: @existing_task.id,
        reminder: attributes_for(:reminder)
      }
    }.to change {@existing_task.reminder.count}.by(1)
    flash[:notice].should_not be_nil
  end

  it "shouldn't allow to enter an invalid reminder to a given task. Should show the list page with a flash error message" do
    expect {
      post :create, {
        list_id: @existing_task.id,
        reminder: attributes_for(:invalid_reminder)
      }
    }.to change { @existing_task.reminder.count }.by(0)
    flash[:alert].should_not be_nil
  end

  
end

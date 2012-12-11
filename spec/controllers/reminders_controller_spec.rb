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

  it "shouldn't allow to enter an invalid reminder to a given task. Should show  a flash error message" do
    expect {
      post :create, {
        list_id: @existing_task.id,
        reminder: attributes_for(:invalid_reminder)
      }
    }.to change { @existing_task.reminder.count }.by(0)
    flash[:alert].should_not be_nil
  end

  it "should allow to update a reminder to a given list and store it if valid. Should show the list page with a flash notice message" do
    existing_reminder = create(:reminder)
    put :update, {
      id: existing_reminder.id,
      reminder: {time: "00:00:00"}
    }
    existing_reminder.reload.time.should eql("00:00:00")    
    flash[:notice].should_not be_nil
  end

  it "shouldn't allow to update an invalid reminder. Should show a flash error message" do
    existing_reminder = create(:reminder)
    put :update, {
      id: existing_reminder.id,
      reminder: {time: ""}
    }
    existing_reminder.reload.time.should_not eql("")    
    flash[:alert].should_not be_nil
  end

  it "should allow to destroy a reminder. should show a flash notice message." do
    post :create, {
      task_id: @existing_task.id,
      reminder: attributes_for(:reminder)
    }
    @created_reminder = assigns[:reminder]
    expect{
      delete :destroy, task_id: @existing_task.id, id: @created_reminder.id        
    }.to change { @existing_task.reminder.count }.by(-1)
    flash[:notice].should_not be_nil
  end
end

require 'spec_helper'

describe TasksController do
  before(:all) do
    @existing_list = create(:list)
  end

  it "should allow to enter a new task to a given list and store it if valid. Should show the list page with a flash notice message" do
    expect {
      post :create, {
        list_id: @existing_list.id,
        task: attributes_for(:task)
      }
    }.to change {@existing_list.tasks.count}.by(1)
    flash[:notice].should_not be_nil
    response.should redirect_to(list_path(@existing_list))
  end

  it "shouldn't allow to enter an invalid task to a given list. Should show the list page with a flash error message" do
    expect {
      post :create, {
        list_id: @existing_list.id,
        task: attributes_for(:invalid_task)
      }
    }.to change { @existing_list.tasks.count }.by(0)
    flash[:alert].should_not be_nil
    response.should redirect_to(list_path(@existing_list))
  end

  it "should allow to update a new task to a given list and store it if valid. Should show the list page with a flash notice message" do
    existing_task = create(:task)
    put :update, {
      id: existing_task.id,
      task: {name: "name changed"}
    }
    existing_task.reload.name.should eql("name changed")    
    flash[:notice].should_not be_nil
    response.should redirect_to(list_path(@existing_list))
  end

  it "shouldn't allow to update an invalid task to a given list. Should show the list page with a flash error message" do
    existing_task = create(:task)
    put :update, {
      id: existing_task,
      task: {name: ""}
    }
    existing_task.reload.name.should_not eql("")
    flash[:alert].should_not be_nil
    response.should redirect_to(list_path(@existing_list))
  end

  it "should be able to delete an existing task. The user redirected to the list page with a flash notice message" do
    post :create, {
      list_id: @existing_list.id,
      task: attributes_for(:task)
    }
    @created_task = assigns[:task]
    expect{
      delete :destroy, list_id: @existing_list.id, id: @created_task.id        
    }.to change { @existing_list.tasks.count }.by(-1)
    response.should redirect_to(list_path(@existing_list))
    flash[:notice].should_not be_nil
  end
end

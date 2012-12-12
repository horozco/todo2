require 'spec_helper'

describe CategoriesController do
  before(:all) do
    @existing_task = create(:task)
  end

  it "should allow to create a new category to a given task. Should show the list page with a flash notice message" do
    post :create, {
      task_id: @existing_task.id,
      category: attributes_for(:category)
    }
    @existing_task.category.should_not be_nil
    flash[:notice].should_not be_nil
  end

  it "shouldn't allow to enter an invalid category to a given task. Should show the list page with a flash error message" do
    expect {
      post :create, {
        list_id: @existing_task.id,
        category: attributes_for(:invalid_category)
      }
    }.to change { @existing_task.category.count }.by(0)
    flash[:alert].should_not be_nil
  end

  it "should allow to update a category to a given list and store it if valid. Should show the list page with a flash notice message" do
    existing_category = create(:category)
    put :update, {
      id: existing_category.id,
      category: {name_category: "new category name"}
    }
    existing_category.reload.time.should eql("new category name")    
    flash[:notice].should_not be_nil
  end
  
  it "shouldn't allow to update an invalid category. Should show a flash error message" do
    existing_category = create(:category)
    put :update, {
      id: existing_category.id,
      category: {name_category: ""}
    }
    existing_category.reload.name_category.should_not eql("")    
    flash[:alert].should_not be_nil
  end

  it "should allow to destroy a category. should show the list page with a flash notice message." do
    post :create, {
      task_id: @existing_task.id,
      category: attributes_for(:category)
    }
    @created_category = assigns[:category]
    expect{
      delete :destroy, task_id: @existing_task.id, id: @created_category.id        
    }.to change { @existing_task.category.count }.by(-1)
    flash[:notice].should_not be_nil
  end
end

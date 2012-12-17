require 'spec_helper'

describe CategoriesController do

  context "a logged in user" do

    login_user

    it "should allow to create a new category to a given task. Should show the list page with a flash notice message" do
      expect {
        post :create, {:category => attributes_for(:category)}
        created_category = assigns[:category]
        created_category.should_not be_new_record
        response.should redirect_to(lists_path)
        flash[:notice].should_not be_nil
      }.to change { Category.count }.by(1)
    end

    it "shouldn't allow to enter an invalid category to a given task. Should show the list page with a flash error message" do
      expect {
        post :create, {:category => attributes_for(:invalid_category)}
        created_category = assigns[:category]
        created_category.should be_new_record
        response.should redirect_to(lists_path)
        flash[:alert].should_not be_nil
      }.to change { Category.count }.by(0)
    end

    it "should allow to update a category to a given list and store it if valid. Should show the list page with a flash notice message" do
      existing_category = create(:category)
      put :update, {
        id: existing_category.id,
        category: { name_category: "Name changed" }
      }
      existing_category.reload.name_category.should eql("Name changed")
      flash[:notice].should_not be_nil
      response.should redirect_to(lists_path)
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
      post :create, {category: attributes_for(:category)}
      @created_category = assigns[:category]
      expect{
        delete :destroy, id: @created_category.id        
      }.to change { Category.count }.by(-1)
      flash[:notice].should_not be_nil
    end
  end
end

require 'spec_helper'

describe ListsController do

  before(:all) do
    @existing_category = create(:category)
  end

  context "a logged in user" do

    login_user

    it "should allow to enter a new list to a given category and store it if valid. Should show the lists path page with a flash notice message" do
      expect {
        post :create, {
          category_id: @existing_category.id,
          list: attributes_for(:list)
        }
      }.to change {@existing_category.lists.count}.by(1)
      response.should redirect_to(lists_path)
      flash[:notice].should_not be_nil
    end

    it "shouldn't allow to enter an invalid list to a given category. Should show the lists path page with a flash error message" do
      expect {
        post :create, {
          category_id: @existing_category.id,
          list: attributes_for(:invalid_list)
        }
      }.to change {@existing_category.lists.count}.by(0)
      response.should redirect_to(lists_path)
      flash[:alert].should_not be_nil
    end
  end
end

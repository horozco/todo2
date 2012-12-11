require 'spec_helper'

describe ListsController do

  context "a logged in user" do

    login_user

    it "should be able to create a new list and be redirected to such list page with a flash notice message" do
      expect {
        post :create, {:list => attributes_for(:list)}
        created_list = assigns[:list]
        created_list.should_not be_new_record
        response.should redirect_to(list_path(created_list))
        created_list.user.should == @logged_in_user
        flash[:notice].should_not be_nil
      }.to change { List.count }.by(1)
    end

    it "Should view all the information of a created list for this user" do
      existing_list = create(:list)
      get :show, id: existing_list.id, user_id: @logged_in_user
      assigns[:list].should == existing_list
      response.should render_template(:show)     
    end

    it "should be able to see the new list page" do
      get :new
      response.should render_template(:new)
    end

    it "shouldn't be able to create an invalid list.  Should be instead redirected to the new list page with a flash error message" do
      expect {
        post :create, {:list => attributes_for(:invalid_list)}
        created_list = assigns[:list]
        created_list.should be_new_record
        response.should render_template(:new)
        flash[:alert].should_not be_nil
      }.to change { List.count }.by(0)
    end 

      it "sholud go to the edit list page" do
        existing_list = create(:list)  
        get :edit, id: existing_list.id
        response.should render_template(:edit)
      end

      it "should be able to submit an update for an existing list. The list should be changed and the user redirected to the show page with a flash notice message" do
        existing_list = create(:list)
        put :update, {
          id: existing_list.id,
          list: { title: "Title changed" }
        }
        existing_list.reload.title.should eql("Title changed")
        flash[:notice].should_not be_nil
        response.should redirect_to(list_path(existing_list))
      end

      it "shouldn't be able to update an existing list with invalid values.  Should be presented with the same edit page and a flash error message" do
        existing_list = create(:list)
        put :update, {
          id: existing_list.id,
          list: { title: "" }
        }
        existing_list.reload.title.should_not eql("")
        flash[:alert].should_not be_nil
        response.should render_template(:edit)
      end

      it "should be able to delete an existing list. The user redirected to the lists page with a flash notice message" do
        post :create, {:list => attributes_for(:list)}
        created_list = assigns[:list]
        expect {
        delete :destroy,id: created_list.id        
        }.to change { List.count }.by(-1)
        response.should redirect_to(lists_url)
        flash[:notice].should_not be_nil 
      end      
  end
end

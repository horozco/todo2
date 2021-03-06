class ListsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_same_user, :only => [:update, :destroy, :show]
  
  def new
    @list = List.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @list = List.new(params[:list])
    if @list.save
      redirect_to lists_path, notice: "List was created" 
    else
      redirect_to lists_path, alert: "List wasn't created :(" 
    end
  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(params[:list])
      redirect_to @list, notice: "List was updated" 
    else
      flash[:alert] = "List wasn't updated :("
      render action: "edit"
    end
  end

  def destroy
    @list = List.find(params[:id])
    if @list.destroy
      flash[:notice] = "List was destroyed successfully"
      redirect_to lists_path
    end
  end

  def show
    @list = List.find(params[:id])
  end

  def index
    @user= current_user
    @lists = List.all
    @category = Category.new
    if @user.categories.size == 0
      flash[:alert] = "You have not created any category. Create an before that create a list."
    end
  end

  def authenticate_same_user
    @list = List.find(params[:id])
    @category = @list.category
      if current_user == @category.user
        true
      else
        redirect_to lists_path, :alert => "You are not authorized to edit this list"
      end
  end
end

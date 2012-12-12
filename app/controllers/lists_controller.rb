class ListsController < ApplicationController
  before_filter :authenticate_user!
  def new
    @list = List.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @list = List.new(params[:list])
    @list.user_id=current_user.id
    if @list.save
      redirect_to lists_path, notice: "List was created" 
    else
      flash[:alert] = "List wasn't created :("
      render action: "index"
    end
  end

  def edit
    @list = List.find(params[:id])
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
  end
end

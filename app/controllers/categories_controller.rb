class CategoriesController < ApplicationController
  before_filter :authenticate_user!
  def create
    @category = Category.new(params[:category])
    @category.user_id=current_user.id
    if @category.save
      respond_to do |format|
        format.html {redirect_to lists_path, :notice => "Your category was created :)"}  
      end
    else
      respond_to do |format|
        format.html {redirect_to lists_path, :alert => "Your category couldn't be submitted. :("}
      end
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to lists_path, notice: "category was updated" 
    else
      redirect_to lists_path, alert: "Category wasn't updated :(" 
    end
  end

  def destroy
    @category = Category.find(params[:id])  
    if @category.destroy
      respond_to do |format|
        format.html {redirect_to lists_path, :notice => "Your category was destroy susscefully :)"}
      end       
    end
  end
end
  
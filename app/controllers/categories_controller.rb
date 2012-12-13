class CategoriesController < ApplicationController
  def create
    @category = @task.build_category(params[:category])
    if @category.save
      respond_to do |format|
        format.html {redirect_to list_path(@task.list), :notice => "Your category was created :)"}  
      end
    else
      respond_to do |format|
        format.html {redirect_to list_path(@task.list), :alert => "Your category couldn't be submitted. :("}
      end
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to @task.list, notice: "category was updated" 
    else
      redirect_to @task.list, alert: "Category wasn't updated :(" 
    end
  end

  def destroy
    @category = Category.find(params[:id])  
    if @category.destroy
      respond_to do |format|
        format.html {redirect_to list_path(@task.list), :notice => "Your category was destroy susscefully :)"}
      end       
    end
  end
end
  
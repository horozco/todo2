class TasksController < ApplicationController
  before_filter :find_list

  def create
    @task = @list.tasks.build(params[:task])
    if @task.save
      respond_to do |format|
        format.html {redirect_to list_path(@list), :notice => "Your task was created :)"}  
      end
    else
      respond_to do |format|
        format.html {redirect_to list_path(@list), :alert => "Your task couldn't be submitted. :("}
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])  
    if @task.destroy
      respond_to do |format|
        format.html {redirect_to list_path(@list), :notice => "Your task was destroy susscefully :)"}
      end       
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      redirect_to @list, notice: "task was updated" 
    else
      flash[:alert] = "Task wasn't updated :("
      redirect_to @list
    end
  end
  def find_list
    @list = List.find(params[:list_id])
  end
end

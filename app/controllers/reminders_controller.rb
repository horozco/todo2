class RemindersController < ApplicationController
  before_filter :find_task
  def create
    @reminder = @task.build_reminder(params[:reminder])
    if @reminder.save
      respond_to do |format|
        format.html {redirect_to list_path(@task.list), :notice => "Your reminder was created :)"}  
      end
    else
      respond_to do |format|
        format.html {redirect_to list_path(@task.list), :alert => "Your reminder couldn't be submitted. :("}
      end
    end
  end

  def update
    @reminder = Reminder.find(params[:id])
    if @reminder.update_attributes(params[:reminder])
      redirect_to @task.list, notice: "reminder was updated" 
    else
      redirect_to @task.list, alert: "reminder wasn't updated :(" 
    end
  end

  def destroy
    @reminder = Reminder.find(params[:id])  
    if @reminder.destroy
      respond_to do |format|
        format.html {redirect_to list_path(@task.list), :notice => "Your reminder was destroy susscefully :)"}
      end       
    end
  end
  def find_task
    @task = Task.find(params[:task_id])
  end
end

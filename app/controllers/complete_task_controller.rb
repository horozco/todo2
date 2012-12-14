class CompleteTaskController < ApplicationController
  def change_status
    @task = Task.find(params[:id])
    (@task.status == true) ? @task.status = false : @task.status = true
    @task.save
    redirect_to @task.list
  end
  def upcomings
  	@categories=current_user.categories
    @cosa=[]
    @categories.each do |categorie|
      categorie.lists.each do |list|
        list.tasks.each do |task|
          task.reminders.each do |reminder|
            @cosa << reminder.date_time
          end
        end
      end
    end
  	respond_to do |format|
  		format.js
    end
  end
end
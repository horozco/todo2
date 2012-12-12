class CompleteTaskController < ApplicationController
  def change_status
    @task = Task.find(params[:id])
    (@task.status == true) ? @task.status = false : @task.status = true
    @task.save
    redirect_to @task.list
  end
end
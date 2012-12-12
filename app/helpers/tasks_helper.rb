module TasksHelper
  def change_status
    @task = Task.find(params[:id])
    (@task.status == true) ? @task.status = false : @task.status = true
    @task.save
    respond_to do |format|
        format.html {redirect_to @list}
    end
  end
end

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    @status= ""

   if @task.completed?
      @status = "this task is completed"
   else
     @status = "this task is not completed"
   end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_creator)
    @task.save
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end
  def update
    @task = Task.find(params[:id])
    @task.update(task_update)
    redirect_to task_path(@task)
  end
def destroy
  @task = Task.find(params[:id])
  @task.destroy
  redirect_to tasks_path
end


  private

  def task_creator
    params.require(:task).permit(:title, :details)
  end

  def task_update
    params.require(:task).permit(:title, :details, :completed)
  end
end

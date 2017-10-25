class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    @status = task_status(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to task_path(@task)
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)

    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy!

    redirect_to tasks_path
  end

  def complete_task
  @task = Task.find(params[:id])
  @task.mark_as_done

  redirect_to tasks_path
  end

  private

  def task_status(task)
    current_task = Task.find(task.id)
    if current_task.complete?
      "complete"
    else
      "not complete"
    end
  end

  def task_params
    params.require(:task).permit(:name, :notes)
  end
end

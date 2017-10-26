class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @uncomplete = Task.where(completed: false)
    @completed = Task.where(completed: true)
  end

  def show
    @task = Task.find(params[:id])
    @status = task_status(@task)
    # @mark_done = complete_task(@task)
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
    @task.completed = true
    @task.update(task_params)

    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy!

    redirect_to tasks_path
  end

  def complete
    params[:tasks_checkbox].each do |check|
      task_id = check
      t = Task.find_by_id(task_id)
      t.update_attribute(:completed, true)
      flash[:notice] = "Task completed"
    end
    redirect_to root_path
  end

  # def complete_task(task)
  # @task = Task.find(task.id)
  # @task.mark_as_done
  # @task.save

  # redirect_to tasks_path
  # end

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
    params.require(:task).permit(:name, :notes, :completed)
  end
end

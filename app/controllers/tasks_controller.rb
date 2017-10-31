class TasksController < ApplicationController

  before_action :find_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show          # GET /restaurants/:id
  end

  def new           # GET /restaurants/new
    @task = Task.new
  end

  def create        # POST /restaurants
    Task.create(task_params)
    redirect_to tasks_path
  end

  def edit          # GET /restaurants/:id/edit
  end

  def update        # PATCH /restaurants/:id
    @task.update(tasks_params)

    redirect_to :back
  end

  def destroy       # DELETE /restaurants/:id
    @task.destroy
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:title, :done)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end

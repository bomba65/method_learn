class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end
  
  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new(lesson_id: params[:id])
  end
  
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task
    else
      render "new"
    end
  end
  
  private
  def task_params
    params.require(:task).permit(:content, :answer, :lesson_id)
  end
  def set_task
    @task = Task.find(params[:id])
  end
end

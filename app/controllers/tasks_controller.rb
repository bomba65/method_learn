class TasksController < ApplicationController
  before_filter :authorize_admin
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
      redirect_to Lesson.find(@task.lesson_id)
    else
      render "new"
    end
  end
  
  def edit
  end

  def update
    if @task.update_attributes task_params
      redirect_to Lesson.find(@task.lesson_id)
    else
      render "edit"
    end
  end
  
  def destroy
    @delete = Task.find(params[:id]).destroy
    flash[:success] = "Task deleted!"
    redirect_to Lesson.find(@delete.lesson_id)
  end
  
  
  private
  def task_params
    params.require(:task).permit(:answer, :lesson_id)
  end
  def set_task
    @task = Task.find(params[:id])
  end
end

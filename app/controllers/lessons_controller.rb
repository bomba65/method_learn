class LessonsController < ApplicationController
  before_filter :authorize_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  def index
    @lessons = Lesson.all
  end
  
  def show
    @theories = @lesson.theories
    @tasks = @lesson.tasks
  end

  def new
    @lesson = Lesson.new(part_id: params[:id])
  end
  
  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to Part.find(@lesson.part_id)
    else
      render "new"
    end
  end
  
  def edit
  end

  def update
    if @lesson.update_attributes lesson_params
      redirect_to Part.find(@lesson.part_id)
    else
      render "edit"
    end
  end
  
  def destroy
    @lesson.destroy
    Task.where(lesson_id: @lesson.id).destroy_all
    Theory.where(lesson_id: @lesson.id).destroy_all
    flash[:success] = "Lesson deleted!"
    redirect_to Part.find(@lesson.part_id)
  end
  
  def getlanguages
    @value = `GET http://api.hackerrank.com/checker/languages.json`
  
   
    respond_to do |format|
      format.json { render json: @value }
    end
  end
  
  private
  def lesson_params
    params.require(:lesson).permit(:name, :part_id, :lesson_order)
  end
  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

end

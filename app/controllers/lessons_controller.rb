class LessonsController < ApplicationController
  before_filter :authorize_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  
  def index
    redirect_to "/courses"
  end
  
  def show
    @theories = @lesson.theories
    @tasks = @lesson.tasks
    @instructions = @lesson.instructions
    @materials = @lesson.materials
    @parts = Part.where(course_id: @lesson.course_id) 
    @lessons = Part.where(course_id: @lesson.course_id)
    
    @usertocourses = UserToCourse.where(user_id: current_user, course_id: @lesson.course_id)
    @procesessOfLessons = ProcessOfLesson.all
  end

  def new
    @lesson = Lesson.new(part_id: params[:id])
  end
  
  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to Course.find(@lesson.course_id)
    else
      render "new"
    end
  end
  
  def edit
  end

  def update
    if @lesson.update_attributes lesson_params
      redirect_to Course.find(@lesson.course_id)
    else
      render "edit"
    end
  end
  
  def destroy
    @lesson.destroy
    flash[:success] = "Lesson deleted!"
    redirect_to Part.find(@lesson.part_id)
  end
  
  def getlanguages
    @value = `GET http://api.hackerrank.com/checker/languages.json`
  
   
    respond_to do |format|
      format.json { render json: @value }
    end
  end
  
  def overcourse
    u =  UserToCourse.find(params[:user_to_course_id])
    u.update_attributes(progress: 1)
     respond_to do |format|
          format.html	{redirect_to courses_path}
          format.js {}
      end
  end
  
  private
  def lesson_params
    params.require(:lesson).permit(:name, :part_id, :lesson_order,:course_id, :exist_code, :point)
  end
  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

end

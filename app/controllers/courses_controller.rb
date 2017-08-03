class CoursesController < ApplicationController
  before_filter :authorize_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  
  def index
    @courses = Course.all
  end

  def show
    @parts = @course.parts
    @start = ProcessOfLesson.where(user_to_course_id: UserToCourse.where(course_id: @course.id, user_id: current_user.id))
    if @start.size > 0
      @last = Lesson.find(@start.last.lesson_id)
    end
    unless @course.lessons.first.nil?
      @start_course = lesson_path(@course.lessons.first)
    else
      @start_course = course_path(@course)
    end
  end
  
  def new
    @course = Course.new
  end
  
  def create
    @course = Course.new(course_params)
    if(@course.save)
      redirect_to @course
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    if @course.update_attributes course_params
      redirect_to courses_path
    else
      render "edit"
    end
  end
  
  def destroy
    @course.destroy
    flash[:success] = "Course deleted!"
    redirect_to courses_path
  end
  
  
  def pythonsave
    @code = params[:code]
    @language = params[:language]
    @tasks = params[:tasks]
    replacements = {'+' => '%2B'}
    @valid_code = @code.gsub(Regexp.union(replacements.keys), replacements)
    @value = `curl -sX POST api.hackerrank.com/checker/submission.json -d 'source=#{@valid_code}&lang=#{@language}&testcases=["1"]&api_key=hackerrank|672467-1620|8e88fd60861080d13008936134465f63c03a5e67'`
    
   
    respond_to do |format|
      format.json { render json: @value }
    end
    
  end
  
  def getlanguages
    @value = `GET http://api.hackerrank.com/checker/languages.json`
  
   
    respond_to do |format|
      format.json { render json: @value }
    end
  end
  
  private
  def course_params
    params.require(:course).permit(:title, :description ,:subtitle, :name, :language)
  end
  def set_course
    @course = Course.find(params[:id])
  end
  
end

class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  
  def index
    @courses = Course.all
  end

  def show
    @parts = @course.parts
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
  
  private
  def course_params
    params.require(:category).permit(:title, :active)
  end
  def set_course
    @course = Course.find(params[:id])
  end
end

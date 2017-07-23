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
  def console
    
    @language = "ruby"
  end
  
  def pythonsave
    @code = params[:code]
    @value = `curl -sX POST api.hackerrank.com/checker/submission.json -d 'source=#{@code}&lang=5&testcases=["1"]&api_key=hackerrank|672467-1620|8e88fd60861080d13008936134465f63c03a5e67'`
  
   
    respond_to do |format|
      format.json { render json: @value }
    end
    
  end

  def python


    


    
  end

  def rubysave
    @code = params[:code]
    path = "hello.rb"


    content=@code
    File.open(path, "w+") do |f|
      f.write(content)
    end
  end

  def ruby

    @value = `ruby hello.rb`

    if $? == 0
      @comand = {"status":1, "output":@value};
    else
      @comand = {"status":2, "output":$?};
    end


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comand }
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

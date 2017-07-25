class PartsController < ApplicationController
  before_filter :authorize_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_part, only: [:show, :edit, :update, :destroy]
  def index
    @parts = Part.all
  end
  
  def show
    @lessons = @part.lessons
  end

  def new
    @part = Part.new(course_id: params[:id])
  end
  
  def create
    @part = Part.new(part_params)
    if @part.save
      redirect_to Course.find(@part.course_id)
    else
      render "new"
    end
  end
  
  def edit
  end

  def update
    if @part.update_attributes part_params
      redirect_to Course.find(@part.course_id)
    else
      render "edit"
    end
  end
  
  private
  def part_params
    params.require(:part).permit(:name, :course_id, :part_order)
  end
  def set_part
    @part = Part.find(params[:id])
  end
end

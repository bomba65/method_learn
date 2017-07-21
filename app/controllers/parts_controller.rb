class PartsController < ApplicationController
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
      redirect_to @part
    else
      render "new"
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

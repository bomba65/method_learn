class InstructionsController < ApplicationController
  before_filter :authorize_admin
  before_action :set_instruction, only: [:show, :edit, :update, :destroy]
  def index
    @instructions = Instruction.all
  end
  
  def show
    @instruction = Instruction.find(params[:id])
  end

  def new
    @instruction = Instruction.new(lesson_id: params[:id])
  end
  
  def create
    @instruction = Instruction.new(instruction_params)
    if @instruction.save
      redirect_to Lesson.find(@instruction.lesson_id)
    else
      render "new"
    end
  end
  
  def edit
  end

  def update
    if @instruction.update_attributes instruction_params
      redirect_to Lesson.find(@instruction.lesson_id)
    else
      render "edit"
    end
  end
  
  def destroy
    @delete = Instruction.find(params[:id]).destroy
    flash[:success] = "Instruction deleted!"
    redirect_to Lesson.find(@delete.lesson_id)
  end
  
  
  private
  def instruction_params
    params.require(:instruction).permit(:content, :lesson_id)
  end
  def set_instruction
    @instruction = Instruction.find(params[:id])
  end
end

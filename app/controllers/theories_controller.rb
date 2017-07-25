class TheoriesController < ApplicationController
  before_filter :authorize_admin
  before_action :set_theory, only: [:show, :edit, :update, :destroy]
  def index
    @theories = Theory.all
  end
  
  def show
    @theory = Theory.find(params[:id])
  end

  def new
    @theory = Theory.new(lesson_id: params[:id])
  end
  
  def create
    @theory = Theory.new(theory_params)
    if @theory.save
      redirect_to Lesson.find(@theory.lesson_id)
    else
      render "new"
    end
  end
  
  def edit
  end

  def update
    if @theory.update_attributes theory_params
      redirect_to Lesson.find(@theory.lesson_id)
    else
      render "edit"
    end
  end
  
  def destroy
    @delete = Theory.find(params[:id]).destroy
    flash[:success] = "Theory deleted!"
    redirect_to Lesson.find(@delete.lesson_id)
  end
  
  private
  def theory_params
    params.require(:theory).permit(:content, :video, :lesson_id)
  end
  def set_theory
    @theory = Theory.find(params[:id])
  end
end

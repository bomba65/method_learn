class TheoriesController < ApplicationController
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
      redirect_to @theory
    else
      render "new"
    end
  end
  
  private
  def theory_params
    params.require(:theory).permit(:content, :video, :lesson_id)
  end
  def set_theory
    @theory = Theory.find(params[:id])
  end
end

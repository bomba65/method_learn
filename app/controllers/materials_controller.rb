class MaterialsController < ApplicationController
  before_filter :authorize_admin
  before_action :set_material, only: [:destroy]

  def new
    @material = Material.new(lesson_id: params[:id])
  end
  
  def create
    @material = Material.new(material_params)
    if @material.save
      redirect_to Lesson.find(@material.lesson_id)
    else
      redirect_to :back
    end
  end
  
  def destroy
    @delete = Material.find(params[:id]).destroy
    flash[:success] = "Material deleted!"
    redirect_to Lesson.find(@delete.lesson_id)
  end

  private
  def material_params
    params.require(:material).permit(:lesson_id, :file)
  end
  def set_material
    @material = Material.find(params[:id])
  end
end

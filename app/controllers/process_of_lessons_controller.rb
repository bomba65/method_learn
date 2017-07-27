class ProcessOfLessonsController < ApplicationController

    def create
        ProcessOfLesson.create(:user_to_course_id => params[:user_to_course_id], :lesson_id => params[:lesson_id])
    end
    
    private
    def process_params
        params.require(:process_of_lesson).permit(:user_to_course_id, :lesson_id)
    end
end

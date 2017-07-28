class ProcessOfLessonsController < ApplicationController

    def create
        if ProcessOfLesson.where(:user_to_course_id=> params[:user_to_course_id], :lesson_id=> params[:lesson_id]).size == 0
            ProcessOfLesson.create(:user_to_course_id => params[:user_to_course_id], :lesson_id => params[:lesson_id])
        end
    end
    
    private
    def process_params
        params.require(:process_of_lesson).permit(:user_to_course_id, :lesson_id)
    end
end

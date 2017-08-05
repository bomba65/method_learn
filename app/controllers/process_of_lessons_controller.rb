class ProcessOfLessonsController < ApplicationController

    def create
        if ProcessOfLesson.where(:user_to_course_id=> params[:user_to_course_id], :lesson_id=> params[:lesson_id]).size > 0
        else
            ProcessOfLesson.create(user_to_course_id: params[:user_to_course_id], lesson_id: params[:lesson_id], point: Lesson.find(params[:lesson_id]).point)
        end
    end
    
    private
    def process_params
        params.require(:process_of_lesson).permit(:user_to_course_id, :lesson_id, :point)
    end
end

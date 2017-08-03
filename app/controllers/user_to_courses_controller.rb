class UserToCoursesController < ApplicationController
    
    def create
        current_user.follow(params[:course_id])
        @course = Course.find(params[:course_id])
        respond_to do |format|
            format.html{ redirect_to root_path}
            format.js
        end
    end
    
    def destroy
        current_user.unfollow(params[:course_id])
        @course = Course.find(params[:course_id])
        respond_to do |format|
            format.html
            format.js
        end
    end
    
    def reset
        @coursetouser = UserToCourse.find_by_course_id_and_user_id(params[:course_id],current_user.id)
        @lessonprogress = ProgressOfLesson.find_by_user(@coursetouser)
        @coursetouser.update_attributes(progress: 0)
        @lessonprogress.delete
        respond_to do |format|
            format.html	{ redirect_to profile}
            format.js {}
        end
    end
    
  
end

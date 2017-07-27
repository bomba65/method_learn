class UserToCoursesController < ApplicationController
    
    def create
        current_user.follow(params[:course_id])
        @course = Course.find(params[:course_id])
        respond_to do |format|
            format.html	{redirect_to courses_path}
            format.js {}
        end
    end
    
    def destroy
        current_user.unfollow(params[:course_id])
        @course = Course.find(params[:course_id])
        respond_to do |format|
            format.html	{ render self}
            format.js {}
        end
    end
  
end

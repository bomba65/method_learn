class StaticPagesController < ApplicationController
  before_filter :authorize_user, only: [:profile]
  

  def about
  end
  
  def profile
    @courses = Course.all
    @finished_courses = UserToCourse.where(user_id: current_user.id, progress: 1)
    @unfinished_courses = UserToCourse.where(user_id: current_user.id, progress: 0)
    @lessons = Lesson.all
  end
  
end

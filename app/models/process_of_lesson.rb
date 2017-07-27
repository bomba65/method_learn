class ProcessOfLesson < ActiveRecord::Base
    belongs_to :lesson
    belongs_to :user_to_course
end

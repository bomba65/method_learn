class Course < ActiveRecord::Base
    has_many :parts
    has_many :course_to_categories
    has_many :user_to_courses
end

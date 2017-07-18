class Category < ActiveRecord::Base
    has_many :course_to_categories
end

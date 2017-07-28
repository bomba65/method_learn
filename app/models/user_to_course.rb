class UserToCourse < ActiveRecord::Base
    belongs_to :course
    belongs_to :user
    has_many :process_of_lesson, :dependent => :destroy
end

class Lesson < ActiveRecord::Base
    belongs_to :part
    has_many :theories, :dependent => :destroy
    has_many :tasks, :dependent => :destroy
    has_many :process_of_lesson, :dependent => :destroy
    has_many :instructions, :dependent => :destroy
end

class Lesson < ActiveRecord::Base
    belongs_to :part
    has_many :theories
    has_many :tasks
end

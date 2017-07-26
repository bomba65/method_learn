class Lesson < ActiveRecord::Base
    belongs_to :part
    has_many :theories, :dependent => :destroy
    has_many :tasks, :dependent => :destroy
end

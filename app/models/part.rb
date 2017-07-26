class Part < ActiveRecord::Base
    has_many :lessons, :dependent => :destroy
    belongs_to :course
end

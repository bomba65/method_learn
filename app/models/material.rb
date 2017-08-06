class Material < ActiveRecord::Base
    belongs_to :lesson
    
    has_attached_file :file
    validates_attachment :file, presence: true,
    content_type: { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }    
end

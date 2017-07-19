module ApplicationHelper

    
    def resource_name
        :user
    end
    
    def resource
        @resource ||= User.new
    end
    
    def resource_class
        User
    end
    
    def devise_mapping
        @devise_mapping ||= Devise.mappings[:user]
    end
    
    def full_title(title)
        base_title = "Method Coding School"
        if title.present?        
            "#{base_title} | #{title}"
        else
            base_title
        end
    end
    
end

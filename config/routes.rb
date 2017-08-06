Rails.application.routes.draw do

  get '/profile' , to: "static_pages#profile"
  get '/about' , to: "static_pages#about"
  get '/home' , to: "static_pages#home"
  get '/download_file' , to: "materials#download_file"

  post "/pythonsave", to: "courses#pythonsave"

  

  delete "/user_to_courses_unfollow", to: "user_to_courses#destroy"
  post "/process_of_lesson", to: "process_of_lessons#create"
  post "/user_to_courses_repeat", to: "user_to_courses#reset"

  get "/getlanguages", to: "courses#getlanguages"
  post "/overcourse", to: "lessons#overcourse"

  get "/start_course", to: "courses#start_course"  
  root 'static_pages#main'
  get "/signin", to: "static_pages#home"

  resources :courses
  resources :lessons
  resources :parts
  resources :theories
  resources :tasks
  resources :instructions
  resources :materials
  
  resources :user_to_courses, only: [:create]



  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

    #RailsAdmin.config do |config|
      #config.authorize_with do |controller|
        #if current_user.present?
          #unless current_user.admin == true
          #  redirect_to main_app.root_path
          #  flash[:error] = "You are not an admin"
         # end
        #else
         # redirect_to main_app.root_path
        #  flash[:error] = "You are not an admin"
       # end
      #end
    #end

  
  devise_for :users

end

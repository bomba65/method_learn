Rails.application.routes.draw do

  get '/profile' , to: "static_pages#profile"
  get '/about' , to: "static_pages#about"
  get '/home' , to: "static_pages#home"
  get '/console' , to: "courses#console"
  get "/python", to: "courses#python"
  post "/pythonsave", to: "courses#pythonsave"
  get "/ruby", to: "courses#ruby"
  post "/rubysave", to: "courses#rubysave"
  
  post "/user_to_courses_follow", to: "user_to_courses#create"
  delete "/user_to_courses_unfollow", to: "user_to_courses#destroy"
  post "/process_of_lesson", to: "process_of_lessons#create"
  post "/user_to_courses_repeat", to: "user_to_courses#reset"

  get "/getlanguages", to: "courses#getlanguages"
  post "/overcourse", to: "lessons#overcourse"

  
  root 'static_pages#home'

  resources :courses
  resources :lessons
  resources :parts
  resources :theories
  resources :tasks
  
  resources :user_to_courses, only: [:create]


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users

end

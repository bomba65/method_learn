Rails.application.routes.draw do

  get '/profile' , to: "static_pages#profile"
  get '/about' , to: "static_pages#about"
  get '/home' , to: "static_pages#home"
  get '/console' , to: "courses#console"
  get "/python", to: "courses#python"
  post "/pythonsave", to: "courses#pythonsave"
  get "/ruby", to: "courses#ruby"
  post "/rubysave", to: "courses#rubysave"
  
  delete "/user_to_courses", to: "user_to_courses#destroy"


  get "/getlanguages", to: "courses#getlanguages"

  
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

Rails.application.routes.draw do

  get '/profile' , to: "static_pages#profile"
  get '/about' , to: "static_pages#about"
  get '/home' , to: "static_pages#home"
  get '/console' , to: "static_pages#console"
  get "/python", to: "static_pages#python"
  post "/pythonsave", to: "static_pages#pythonsave"
  get "/ruby", to: "static_pages#ruby"
  post "/rubysave", to: "static_pages#rubysave"
  
  
  root 'static_pages#home'

  resources :courses
  resources :lessons
  resources :parts
  resources :theories
  resources :tasks
  
  resources :user_to_courses, only: [:create, :destroy]


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users

end

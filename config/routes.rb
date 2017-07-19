Rails.application.routes.draw do

  get '/profile' , to: "static_pages#profile"

  get '/lessons' , to: "lessons#index"

  get '/about' , to: "static_pages#about"

  get '/home' , to: "static_pages#home"

  root 'static_pages#home'

  resources :courses
  resources :lessons

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

end

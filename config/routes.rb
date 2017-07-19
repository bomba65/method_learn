Rails.application.routes.draw do

  get '/about' , to: "static_pages#about"
  
  root 'static_pages#home'
  
  resources :courses
  resources :lessons

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
end

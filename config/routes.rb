Rails.application.routes.draw do
  
  get '/lessons' , to: "lessons#index"

  get '/about' , to: "static_pages#about"
  
  root 'static_pages#home'
  
  resources :courses

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
end

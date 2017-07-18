Rails.application.routes.draw do
  
  resources :courses

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
end

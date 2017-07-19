Rails.application.routes.draw do
<<<<<<< HEAD
=======
  
  get '/profile' , to: "static_pages#profile"
  
  get '/lessons' , to: "lessons#index"
>>>>>>> 20cc86a34379763cdd601ec55d29c13444f323ef

  get '/about' , to: "static_pages#about"
  
  get '/home' , to: "static_pages#home"
  
  root 'static_pages#home'
  
  resources :courses
  resources :lessons

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  
end


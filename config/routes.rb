Rails.application.routes.draw do
  resources :plant_data
  resources :irrigation_systems
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "home#index"
  root 'irrigation_systems#index'
end

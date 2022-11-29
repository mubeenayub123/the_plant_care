Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :complaints
  get 'settings/index'
  resources :plant_categories
  resources :plant_data
  get 'export', to: 'plant_data#export', as: :export_plant_data
  resources :irrigation_systems
  resources :plants
  resources :dashboard
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "home#index"
  root 'irrigation_systems#index'
end

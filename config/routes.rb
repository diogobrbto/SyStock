Rails.application.routes.draw do
  root 'main#home'
  devise_for :users
  
  resources :categories
  resources :products

  namespace :api do
      resources :products, only: [:index, :show]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

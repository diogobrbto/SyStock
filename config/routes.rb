Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/show', to: 'categories#show', as: 'show_categorie'
  get 'categories/new', to: 'categories#new', as: 'new_categorie'
  get 'categories/create'
  get 'categories/edit'
  get 'categories/update'
  get 'categories/destroy'

  get 'products/index'
  get 'products/show', to: 'products#show', as: 'show_product'
  get 'products/new', to: 'products#new', as: 'new_product'
  get 'products/create'
  get 'products/edit'
  get 'products/update'
  get 'products/destroy'

  devise_for :users
  root 'main#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

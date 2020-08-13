Rails.application.routes.draw do
  root 'products#index'

  # PRODUCTS
  resources :products, only: %i[index new create]

  # SESSIONS
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # USERS
  get '/signup', to: 'users#new'
  resources :users

  # CARTS
  post 'change_quantity', to: 'products_carts#change_quantity'
  resources :carts, only: %i[show]
  resources :products_carts, only: %i[create destroy]

  namespace :admin do
    root 'users#index'

    resources :users, only: %i[index destroy]
    resources :products, only: %i[index create destroy show]
    resources :carts,only: %i[show]
  end

  namespace :account_management do
    resources :account_activations, only: %i[edit]
    resources :password_resets, only: %i[new create edit update]
  end
end

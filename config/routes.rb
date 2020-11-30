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

  # ORDERS
  resources :orders, only: %i[new show create index]

  namespace :admin do
    root 'users#index'

    resources :users, only: %i[index destroy]

    resources :products
    resources :carts, only: %i[show]

    resources :orders, only: %i[index destroy]
    put 'orders/:id', to: 'orders#change_status!'
  end

  namespace :account_management do
    resources :account_activations, only: %i[edit]
    resources :password_resets, only: %i[new create edit update]
  end
end

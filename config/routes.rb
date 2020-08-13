Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
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
  resources :carts, only: %i[show]
  post '/carts', to: 'carts#add'

  resources :account_activations, only: %i[edit]
  resources :password_resets, only: %i[new create edit update]

  namespace :admin do
    root 'users#index'

    resources :users

    resources :products
  end
end

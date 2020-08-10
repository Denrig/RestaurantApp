Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#new'

  # PRODUCTS
  resources :products, only: %i[index new create]

  # SESSIONS
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # USERS
  get '/signup', to: 'users#new'
  resources :users, only: %i[index show create edit update]

  # CARTS
  resources :carts, only: %i[show]
  post '/carts', to: 'carts#add'
end

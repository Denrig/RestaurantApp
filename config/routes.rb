Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'products#index'

  get '/products' => 'products#index'
  get '/products/new' => 'products#new'
  post '/products' => 'products#create'
end

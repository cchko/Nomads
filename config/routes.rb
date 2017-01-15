Rails.application.routes.draw do

  root to: 'jobs#index'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :jobs
  resources :rides
  resources :stays

end

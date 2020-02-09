Rails.application.routes.draw do

  get 'mode_change/new'

  root 'static_pages#home'
  
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get '/change', to: 'mode_change#new'
  
  resources :menu, only: [:show]
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts, only: [:create, :destroy]
  
end

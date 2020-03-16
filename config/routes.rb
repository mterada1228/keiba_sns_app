Rails.application.routes.draw do

  root 'static_pages#home'
  
  get 'userinfo_change/new'
  get 'userinfo_change/update'
  get 'kaimes/create'
  get 'kaimes/delete'
  get 'mode_change/new'
  
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get '/change', to: 'mode_change#new'
  
  resources :menus, only: [:show, :index]
  
  resources :users do
    # GET /users/id/following, /users/id/followers の url へ route する
    member do
      get :following, :followers
    end
  end
  
  resources :sessions, only: [:new, :create, :destroy]
  
  resources :microposts do
    member do
      # GET /microposts/id/detail, /microposts/id/reply
      get :detail, :reply
    end
  end
  
  resources :admins do
    collection do
      get 'update_hitting'
    end
  end

  resources :kaimes, only: [:create, :destroy]
  resources :userinfo_change, only: [:new]
  resources :relationships,       only: [:create, :destroy]
  resources :reply_relationships,       only: [:create]
  resources :favorites, only: [:create, :destroy]
  
  
end

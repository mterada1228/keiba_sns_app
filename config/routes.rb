Rails.application.routes.draw do

  root 'static_pages#home'
  
  get  '/signup',  to: 'users#new'

  resources :menu, only: [:show]
  resources :user
  
end

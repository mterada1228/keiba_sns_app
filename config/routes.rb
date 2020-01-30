Rails.application.routes.draw do

  root 'static_pages#home'

  # Menu
  resources :menu, only: [:show]

end

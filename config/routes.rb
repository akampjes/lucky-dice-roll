Rails.application.routes.draw do
  resources :plays
  resources :sessions

  root 'plays#index'
end

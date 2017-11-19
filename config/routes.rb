Rails.application.routes.draw do
  resources :plays
  resource :session

  root 'plays#index'
end

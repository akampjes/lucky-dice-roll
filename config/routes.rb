Rails.application.routes.draw do
  resource :roll
  resource :play
  resource :session

  root 'plays#show'
end

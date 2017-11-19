Rails.application.routes.draw do
  resource :play
  resource :session

  root 'plays#show'
end

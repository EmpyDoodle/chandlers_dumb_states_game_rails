Rails.application.routes.draw do
  root 'pages#home'
  get '/game', to: 'game#game'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

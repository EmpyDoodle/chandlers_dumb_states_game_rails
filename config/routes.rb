Rails.application.routes.draw do
  root 'pages#home'
  get '/game', to: 'game#game'
  get '/game/guess'
  get '/game/hint'
  get '/game/complete'
  get '/game/capitals'
  get '/game/cap_guess'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

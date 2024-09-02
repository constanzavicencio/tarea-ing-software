Rails.application.routes.draw do
  resources :games, only: [:index, :show, :create, :destroy] do
    resources :reviews, only: [:index]
  end
  
  resources :reviews, only: [:create, :update, :show]
  resources :players, only: [:show, :create, :destroy]

  post 'players/:favourite_game_id', to: 'players#create'

  get '/players/:player_id/game', to: 'players#favourite_game_id'
  get '/games/top/:quantity', to: 'games#top_games'
  get '/reviews/:review_id/player', to: 'reviews#player'
  
  delete '/games/low', to: 'games#delete_lowest'
  delete '/games', to: 'games#destroy'
  delete '/players', to: 'players#destroy'
  patch '/games/calification_update/:game_id', to: 'games#update_calification'
end

class PlayersController < ApplicationController
    def show
      player = Player.find(params[:id])
      render json: player
    end
  
    def create
      game = Game.find(params[:favourite_game_id])
      player = Player.new(player_params.merge(favourite_game_id: game))
      if player.save
        render json: player
      else
        render json: player.errors
      end
    end
  
    def destroy
      Player.destroy_all
      render json: []
    end
  
    def favourite_game_id
      player = Player.find(params[:player_id])
      render json: player.favourite_game_id
    end
  
    private
  
    def player_params
      params.require(:player).permit(:name, :preference, :phone)
    end
  end
  
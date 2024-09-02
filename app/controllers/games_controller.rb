class GamesController < ApplicationController
    def index
      games = Game.all
      render json: games
    end
  
    def show
      game = Game.find(params[:id])
      render json: game
    end
  
    def create
      game = Game.new(game_params)
      if game.save
        render json: game, status: :created
      else
        render json: game.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
        if params[:id]
          game = Game.find_by(id: params[:id])
          if game
            game.destroy
            render json: {}
          else
            render json: { error: "Game not found" }, status: :not_found
          end
        else
          Game.destroy_all
          render json: []
        end
    end
  
    def top_games
      games = Game.order(calification: :desc, id: :desc).limit(params[:quantity])
      render json: games
    end
  
    def delete_lowest
      game = Game.order(:calification, :id).first
      render json: game if game.destroy
    end
  
    def update_calification
      game = Game.find(params[:game_id])
      game.calification = game.reviews.average(:calification)
      if game.save
        render json: game
      else
        render json: game.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def game_params
      params.require(:game).permit(:name, :calification, :description)
    end
  end
  
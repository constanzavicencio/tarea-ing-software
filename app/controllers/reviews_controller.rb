class ReviewsController < ApplicationController
    def index
      reviews = Review.where(game_id: params[:game_id])
      render json: reviews
    end
  
    def show
      review = Review.find(params[:id])
      render json: review
    end
  
    def create
      review = Review.new(review_params)
      if review.save
        render json: review, status: :created
      else
        render json: review.errors, status: :unprocessable_entity
      end
    end
  
    def update
      review = Review.find(params[:id])
      if review.update(review_params)
        render json: review
      else
        render json: review.errors, status: :unprocessable_entity
      end
    end
  
    def player
      review = Review.find(params[:review_id])
      player = review.player
      render json: player
    end
  
    private
  
    def review_params
      params.require(:review).permit(:title, :description, :calification, :player_id, :game_id)
    end
  end
  
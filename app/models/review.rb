class Review < ApplicationRecord
  belongs_to :game
  belongs_to :player

  validates :title, :description, :calification, :player_id, :game_id, presence: true
end

class Player < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :favourite_game_id, class_name: 'Game', foreign_key: 'favourite_game_id', optional: true

  validates :name, :preference, :phone, presence: true
end

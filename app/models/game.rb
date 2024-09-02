class Game < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :players, dependent: :nullify
  
    validates :name, :calification, :description, presence: true
    validates :calification, numericality: { greater_than_or_equal_to: 1.0, less_than_or_equal_to: 10.0 }
  end
  
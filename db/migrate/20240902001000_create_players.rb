class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :preference
      t.string :phone
      t.references :favourite_game_id, foreign_key: { to_table: :games }

      t.timestamps
    end
  end
end

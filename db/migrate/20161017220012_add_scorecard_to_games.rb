class AddScorecardToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :roll_result, :text
    add_column :games, :turn_count, :integer
    add_column :games, :scorecard, :text
  end
end

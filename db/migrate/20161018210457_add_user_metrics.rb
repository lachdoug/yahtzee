class AddUserMetrics < ActiveRecord::Migration[5.0]
  create_table :user_metrics do |t|
    t.integer :user_id
    t.integer :high_score
    t.integer :average_score
    t.integer :game_count
    t.timestamps
  end
end

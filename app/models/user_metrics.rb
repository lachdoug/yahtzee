class UserMetrics < ApplicationRecord

  belongs_to :user

  def update
    scores = user.games.map(&:score).compact
    self.high_score = scores.max
    self.game_count = scores.count
    self.average_score = ( scores.sum / game_count ).to_i
    self.save
  end

end

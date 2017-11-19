class Play < ApplicationRecord
  has_many :rolls

  def current_points
    if lost?
      points - bet
    else
      points - bet +
        ((2 ** count_wins) * bet)
    end
  end

  def game_over?
    finished_at || rolls.count >= 3 || lost?
  end

  def lost?
    rolls.any?(&:unsuccessful?)
  end

  private

  def count_wins
    rolls.select(&:successful?).count
  end
end

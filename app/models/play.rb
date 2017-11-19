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

  def data
    {
      flybuys_number: flybuys_number,
      bet: bet,
      start_points: points,
      current_points: current_points,
      finished: !!finished_at,
      rolls:
        rolls.map { |roll|
          {
            result: roll.result,
            success: roll.successful?
          }
        }
    }
  end

  private

  def count_wins
    rolls.select(&:successful?).count
  end
end

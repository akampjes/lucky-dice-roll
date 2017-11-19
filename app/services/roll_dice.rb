class RollDice
  attr_accessor :play, :roll, :result

  def initialize(play:, roll:, result: nil)
    @play = play
    @roll = roll
    @result = result || SecureRandom.random_number(6) + 1
  end

  def call
    return false if play.game_over?

    ActiveRecord::Base.transaction do
      old_points = play.points_difference

      roll.result = result
      roll.save!

      play.reload
      play.update!(finished_at: Time.current) if play.game_over?

      points_delta =  play.points_difference - old_points
      # TODO don't really want to be making API calls within a database transaction
      balance_account(points_delta)
    end

    roll
  end

  private

  def balance_account(points_delta)
    if points_delta > 0
      CreditPoints.new(flybuys_number: play.flybuys_number, points: points_delta.abs).call
    elsif points_delta < 0
      DebitPoints.new(flybuys_number: play.flybuys_number, points: points_delta.abs).call
    end
  end
end
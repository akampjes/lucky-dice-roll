class RollDice
  attr_accessor :play, :roll

  def initialize(play:, roll:)
    @play = play
    @roll = roll
  end

  def call
    return false if play.game_over?

    result = SecureRandom.random_number(6) + 1

    # TODO: remove this
    result = 2
    roll.result = result
    roll.save!

    play.reload
    play.update!(finished_at: Time.current) if play.game_over?

    roll
    # TODO: need to re-account points on their account too via API
  end
end
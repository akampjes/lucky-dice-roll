class RollDice
  attr_accessor :play, :roll

  def initialize(play:, roll:)
    @play = play
    @roll = roll
  end

  def call
    result = SecureRandom.random_number(6) + 1
    roll.result = result
    roll.save!

    play.reload
    play.update!(finished_at: Time.current) if play.game_over?

    # TODO: need to re-account points on their account too via API
  end
end
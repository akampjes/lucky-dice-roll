class CreateNewPlay
  attr_accessor :flybuys_number, :current_play, :bet
  def initialize(flybuys_number:, current_play: , bet:)
    @flybuys_number = flybuys_number
    @current_play = current_play
    @bet = bet
  end

  def call
    return false if current_play && !current_play.game_over?

    current_points = GetPoints.new(flybuys_number).call

    ActiveRecord::Base.transaction do
      # Close off the current play as finished before we create a new play
      if current_play && current_play.finished_at.nil?
        current_play.update!(finished_at: Time.current)
      end

      @play = Play.create!(bet: bet, flybuys_number: flybuys_number, points: current_points)
    end

    @play
  end
end
require 'rails_helper'

RSpec.describe RollDice, type: :service do
  let(:play) { Play.new(flybuys_number: '6014012345678912', points: 10_000, bet: 20) }
  let(:roll) { Roll.new(play: play) }
  let(:random_number) { 2 }

  subject(:roll_dice) { RollDice.new(play: play, roll: roll) }

  before do
    expect(SecureRandom).to receive(:random_number).and_return(random_number)
  end

  describe "#call" do
    it "sets a result on a roll" do
      roll_dice.call

      expect(roll.result).to be_present
    end

    it "saves roll" do
      roll_dice.call

      expect(roll).to be_persisted
    end

    it "sets finished_at if we're finished playing" do
      expect(play.finished_at).to be_falsey
      expect(play).to receive(:game_over?).and_return(true)

      roll_dice.call

      expect(play.finished_at).to be_truthy
    end
  end
end
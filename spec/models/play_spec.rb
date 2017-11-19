require 'rails_helper'

def create_roll(play, win)
  if win
    Roll.create!(play: play, result: 2)
  else
    Roll.create!(play: play, result: 1)
  end
end

RSpec.describe Play, type: :model do
  let(:flybuys_number) { '6014012345678912' }
  let(:points) { 10_000 }
  let(:bet) { 20 }

  subject(:play) { Play.new(flybuys_number: flybuys_number, points: points, bet: bet) }

  describe "#lost?" do
    context "when there is only one unsuccessful roll" do
      it "is lost" do
        create_roll(play, false)

        expect(play).to be_lost
      end
    end

    context "when there are a mix of rolls with a losing roll" do
      it "is lost" do
        create_roll(play, true)
        create_roll(play, false)

        expect(play).to be_lost
      end
    end

    context "when there are no losing rolls" do
      it "isn't lost" do
        create_roll(play, true)
        create_roll(play, true)
        create_roll(play, true)

        expect(play).not_to be_lost
      end
    end
  end

  describe "#game_over?" do
    context "when there are 3 rolls" do
      it "is game over" do
        create_roll(play, true)
        create_roll(play, true)
        create_roll(play, true)

        expect(play).to be_game_over
      end
    end

    context "when the game is finished" do
      it "is game over" do
        play.finished_at = Time.now

        expect(play).to be_game_over
      end
    end

    context "when there is an unsuccessful roll" do
      it "is game over" do
        create_roll(play, true)
        create_roll(play, false)

        expect(play).to be_game_over
      end
    end
  end

  describe "#current_points" do
    context "when you have lost" do
      it "subtracts your bet from your points" do
        create_roll(play, false)

        expect(play.current_points).to eq(play.points - play.bet)
      end
    end

    context "when you haven't lost (yet)" do
      it "is the same when you haven't rolled" do
        expect(play.current_points).to eq(play.points)
      end

      it "doubles when you have rolled successfully" do
        create_roll(play, true)

        expect(play.current_points).to eq(play.points - play.bet + 2 * play.bet)
      end

      it "doubles agains when you have rolled successfully again" do
        create_roll(play, true)
        create_roll(play, true)

        expect(play.current_points).to eq(play.points - play.bet + (play.bet * 2) * 2)
      end
    end
  end
end

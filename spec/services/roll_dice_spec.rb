require 'rails_helper'

RSpec.describe RollDice, type: :service do
  let(:flybuys_number) { '6014012345678912' }
  let(:play) { Play.create!(flybuys_number: flybuys_number, points: 10_000, bet: 20) }
  let(:roll) { Roll.new(play: play) }
  let(:result) { 2 }

  subject(:roll_dice) { RollDice.new(play: play, roll: roll, result: result) }

  before do
    allow(SecureRandom).to receive(:random_number).and_return(result)
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

    it "returns false if we can't play anymore" do
      expect(play).to receive(:game_over?).and_return(true)

      expect(roll_dice.call).to be_falsey
    end

    context "when the first roll is unsuccessful" do
      let(:result) { 1 }

      it "debits points from your acount" do
        expect(DebitPoints).to receive(:new).with(hash_including(flybuys_number: flybuys_number, points: 20)).and_return(-> { true })

        roll_dice.call
      end

      it "sets finished at" do
        roll_dice.call

        play.reload
        expect(play.finished_at).to be_truthy
      end
    end

    context "when the first roll is successful" do
      it "credits points to your account" do
        expect(CreditPoints).to receive(:new).with(hash_including(flybuys_number: flybuys_number, points: 20)).and_return(-> { true })

        roll_dice.call
      end
    end

    context "when the second roll is also successful" do
      before do
        play.save!
        Roll.create!(play: play, result: 2)
      end

      it "credits you the difference in points between rolls" do
        expect(CreditPoints).to receive(:new).with(hash_including(flybuys_number: flybuys_number, points: 40)).and_return(-> { true })

        roll_dice.call
      end
    end

    context "when the third roll is also successful" do
       before do
        play.save!
        Roll.create!(play: play, result: 2)
        Roll.create!(play: play, result: 2)
      end

      it "credits you the difference in points between rolls" do
        expect(CreditPoints).to receive(:new).with(hash_including(flybuys_number: flybuys_number, points: 80)).and_return(-> { true })

        roll_dice.call
      end
    end
  end
end
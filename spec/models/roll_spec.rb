require 'rails_helper'

RSpec.describe Roll, type: :model do
  let(:play) { Play.new(flybuys_number: '6014012345678912', points: 10_000, bet: 20) }
  let(:result) { 2 }

  subject(:roll) { Roll.new(result: result, play: play) }

  describe "#successful?" do
    context "when a 2 is rolled" do
      it "is successful" do
        expect(roll).to be_successful
      end
    end
    context "when not 2 is rolled" do
      it "is unsuccessful when 1 is rolled" do
        roll.result = 1

        expect(roll).not_to be_successful
        expect(roll).to be_unsuccessful
      end

      it "is unsuccessful when 6 is rolled" do
        roll.result = 6

        expect(roll).not_to be_successful
        expect(roll).to be_unsuccessful
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Session, type: :model do
  let(:flybuys_number) { '6014012345678912' }
  let(:password) { '1234' }

  subject(:session) { Session.new(flybuys_number: flybuys_number, password: password) }

  it { is_expected.to be_valid }

  context "when the password is blank" do
    let(:password) { nil }

    it { is_expected.to be_invalid }
  end

  context "when the flybuys number is blank" do
    let(:flybuys_number) { nil }

    it { is_expected.to be_invalid }
  end

  context "when flybuys number doesn't start with 6014" do
    let(:flybuys_number) { '1111012345678912' }

    it { is_expected.to be_invalid }
  end

  context "when flybuys number isn't 16 digits long" do
    let(:flybuys_number) { '601401234' }

    it { is_expected.to be_invalid }
  end

  context "when flybuys number isn't made of digits" do
    let(:flybuys_number) { '601401234567891a' }

    it { is_expected.to be_invalid }
  end
end
require 'rails_helper'

RSpec.describe ValidateLogin, type: :service do
  let(:flybuys_number) { '6014012345678912' }
  let(:password) { '1234' }
  let(:session) { Session.new(flybuys_number: flybuys_number, password: password) }

  subject(:validate_login) { ValidateLogin.new(session) }

  context "with a valid session" do
    it "returns the session" do
      expect(subject.call).to eq session
    end
  end

  context "when session is invalid" do
    it "is also not valid" do
      expect(session).to receive(:valid?).and_return(false)

      expect(subject.call).to be_falsey
    end
  end
end
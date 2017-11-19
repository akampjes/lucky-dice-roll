require 'rails_helper'

RSpec.describe "Rolls", type: :request do
  describe "GET /rolls" do
    it "works! (now write some real specs)" do
      get rolls_path
      expect(response).to have_http_status(200)
    end
  end
end

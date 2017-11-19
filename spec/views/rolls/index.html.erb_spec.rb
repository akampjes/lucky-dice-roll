require 'rails_helper'

RSpec.describe "rolls/index", type: :view do
  before(:each) do
    assign(:rolls, [
      Roll.create!(
        :result => 2
      ),
      Roll.create!(
        :result => 2
      )
    ])
  end

  it "renders a list of rolls" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end

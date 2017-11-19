require 'rails_helper'

RSpec.describe "plays/index", type: :view do
  before(:each) do
    assign(:plays, [
      Play.create!(
        :flybuys_number => "Flybuys Number",
        :points => 2,
        :bet => 3
      ),
      Play.create!(
        :flybuys_number => "Flybuys Number",
        :points => 2,
        :bet => 3
      )
    ])
  end

  it "renders a list of plays" do
    render
    assert_select "tr>td", :text => "Flybuys Number".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end

require 'rails_helper'

RSpec.describe "plays/new", type: :view do
  before(:each) do
    assign(:play, Play.new(
      :flybuys_number => "MyString",
      :points => 1,
      :bet => 1
    ))
  end

  it "renders new play form" do
    render

    assert_select "form[action=?][method=?]", plays_path, "post" do

      assert_select "input[name=?]", "play[flybuys_number]"

      assert_select "input[name=?]", "play[points]"

      assert_select "input[name=?]", "play[bet]"
    end
  end
end

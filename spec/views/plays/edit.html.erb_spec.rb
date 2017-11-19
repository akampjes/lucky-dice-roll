require 'rails_helper'

RSpec.describe "plays/edit", type: :view do
  before(:each) do
    @play = assign(:play, Play.create!(
      :flybuys_number => "MyString",
      :points => 1,
      :bet => 1
    ))
  end

  it "renders the edit play form" do
    render

    assert_select "form[action=?][method=?]", play_path(@play), "post" do

      assert_select "input[name=?]", "play[flybuys_number]"

      assert_select "input[name=?]", "play[points]"

      assert_select "input[name=?]", "play[bet]"
    end
  end
end

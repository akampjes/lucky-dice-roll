require 'rails_helper'

RSpec.describe "rolls/edit", type: :view do
  before(:each) do
    @roll = assign(:roll, Roll.create!(
      :result => 1
    ))
  end

  it "renders the edit roll form" do
    render

    assert_select "form[action=?][method=?]", roll_path(@roll), "post" do

      assert_select "input[name=?]", "roll[result]"
    end
  end
end

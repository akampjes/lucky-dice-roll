require 'rails_helper'

RSpec.describe "rolls/new", type: :view do
  before(:each) do
    assign(:roll, Roll.new(
      :result => 1
    ))
  end

  it "renders new roll form" do
    render

    assert_select "form[action=?][method=?]", rolls_path, "post" do

      assert_select "input[name=?]", "roll[result]"
    end
  end
end

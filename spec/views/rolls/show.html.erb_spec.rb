require 'rails_helper'

RSpec.describe "rolls/show", type: :view do
  before(:each) do
    @roll = assign(:roll, Roll.create!(
      :result => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
  end
end

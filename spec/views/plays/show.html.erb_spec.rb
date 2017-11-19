require 'rails_helper'

RSpec.describe "plays/show", type: :view do
  before(:each) do
    @play = assign(:play, Play.create!(
      :flybuys_number => "Flybuys Number",
      :points => 2,
      :bet => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Flybuys Number/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end

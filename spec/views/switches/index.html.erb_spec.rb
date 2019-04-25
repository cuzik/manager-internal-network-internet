require 'rails_helper'

RSpec.describe "switches/index", type: :view do
  before(:each) do
    assign(:switches, [
      Switch.create!(),
      Switch.create!()
    ])
  end

  it "renders a list of switches" do
    render
  end
end

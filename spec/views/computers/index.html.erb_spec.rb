require 'rails_helper'

RSpec.describe "computers/index", type: :view do
  before(:each) do
    assign(:computers, [
      Computer.create!(),
      Computer.create!()
    ])
  end

  it "renders a list of computers" do
    render
  end
end

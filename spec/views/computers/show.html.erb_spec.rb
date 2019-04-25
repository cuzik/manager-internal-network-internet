require 'rails_helper'

RSpec.describe "computers/show", type: :view do
  before(:each) do
    @computer = assign(:computer, Computer.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end

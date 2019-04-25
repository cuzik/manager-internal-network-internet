require 'rails_helper'

RSpec.describe "switches/show", type: :view do
  before(:each) do
    @switch = assign(:switch, Switch.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end

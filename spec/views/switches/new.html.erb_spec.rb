require 'rails_helper'

RSpec.describe "switches/new", type: :view do
  before(:each) do
    assign(:switch, Switch.new())
  end

  it "renders new switch form" do
    render

    assert_select "form[action=?][method=?]", switches_path, "post" do
    end
  end
end

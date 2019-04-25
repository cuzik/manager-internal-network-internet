require 'rails_helper'

RSpec.describe "switches/edit", type: :view do
  before(:each) do
    @switch = assign(:switch, Switch.create!())
  end

  it "renders the edit switch form" do
    render

    assert_select "form[action=?][method=?]", switch_path(@switch), "post" do
    end
  end
end

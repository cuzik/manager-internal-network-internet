require 'rails_helper'

RSpec.describe "computers/edit", type: :view do
  before(:each) do
    @computer = assign(:computer, Computer.create!())
  end

  it "renders the edit computer form" do
    render

    assert_select "form[action=?][method=?]", computer_path(@computer), "post" do
    end
  end
end

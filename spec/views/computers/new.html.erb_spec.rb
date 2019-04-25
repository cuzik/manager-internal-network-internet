require 'rails_helper'

RSpec.describe "computers/new", type: :view do
  before(:each) do
    assign(:computer, Computer.new())
  end

  it "renders new computer form" do
    render

    assert_select "form[action=?][method=?]", computers_path, "post" do
    end
  end
end

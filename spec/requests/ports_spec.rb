require 'rails_helper'

RSpec.describe "Ports", type: :request do
  describe "GET /ports" do
    it "works! (now write some real specs)" do
      get ports_path
      expect(response).to have_http_status(200)
    end
  end
end

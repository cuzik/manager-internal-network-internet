require 'rails_helper'

RSpec.describe "Switches", type: :request do
  let(:user) { create(:user, owner: true) }

  setup do
    login_as(user)
  end

  describe "GET /switches" do
    it "works! (now write some real specs)" do
      get switches_path
      expect(response).to have_http_status(200)
    end
  end
end

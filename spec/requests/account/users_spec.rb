require 'rails_helper'

RSpec.describe "Account::Users", type: :request do
  let(:user) { create(:user, owner: true) }

  setup do
    login_as(user)
  end

  describe "GET /account/users" do
    it "works! (now write some real specs)" do
      get account_users_path
      expect(response).to have_http_status(200)
    end
  end
end

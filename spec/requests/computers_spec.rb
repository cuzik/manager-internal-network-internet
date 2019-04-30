require 'rails_helper'

RSpec.describe 'Computers', type: :request do
  describe('Admin user execute computer requets') do
    let(:user) { create(:user, owner: true) }
    let(:computer) { create(:computer, account: user.account) }
    let(:account) { create(:account) }

    setup do
      login_as(user)
    end

    context('When GET /computers') do
      it 'should return success' do
        get(computers_path)
        expect(response).to have_http_status(:success)
      end
    end

    context('When GET /computers/:id') do
      it 'should return success if computer exists' do
        get(computer_path(computer))
        expect(response).to have_http_status(:success)
      end

      it "should return 302 if computer don't belong to the same account of current_user" do
        computer.update(account: account)

        get(computer_path(computer.id))
        expect(response).to have_http_status(302)
      end
    end

    context('When GET /computers/new') do
      it "should return success" do
        get(new_computer_path)
        expect(response).to have_http_status(:success)
      end
    end

    context('When GET /computers/:id/edit') do
      it 'should return success if computer exists' do
        get(edit_computer_path(computer))
        expect(response).to have_http_status(:success)
      end

      it "should return 302 if computer don't belong to the same account of current_user" do
        computer.update(account: account)

        get(edit_computer_path(computer.id))
        expect(response).to have_http_status(302)
      end
    end
  end
end

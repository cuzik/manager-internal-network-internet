require 'rails_helper'

RSpec.describe Account::UsersHelper, type: :helper do
  let(:user) {create(:user)}
  let(:user1) {create(:user)}

  setup do
    allow(helper).to receive(:current_user).and_return(user)
  end

  context('When access the user list') do
    context('and try render your user card') do
      it('should #class_color_user returns "bg-secondary"') do
        expect(helper.class_color_user(user)).to eq('bg-secondary')
      end
    end

    context('and try render other user card') do
      it('should #class_color_user returns "bg-light"') do
        expect(helper.class_color_user(user1)).to eq('bg-light')
      end
    end
  end
end

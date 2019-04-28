require 'rails_helper'

RSpec.describe Port, type: :model do
  context 'associations' do
    it { should belong_to(:switch) }

    it { should have_one(:account).through(:switch) }
    it { should have_one(:computer) }
  end


  subject { create(:port) }

  context 'validations' do
    it { should validate_presence_of(:number) }

    it do
      should validate_uniqueness_of(:number)
        .scoped_to(:switch_id)
        .with_message('Não parça.')
    end
  end
end

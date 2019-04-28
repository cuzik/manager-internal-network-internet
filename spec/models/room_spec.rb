require 'rails_helper'

RSpec.describe Room, type: :model do
  context 'associations' do
    it { should belong_to(:account) }

    it { should have_many(:computers).dependent(:destroy) }
  end


  subject { create(:room) }

  context 'validations' do
    it { should validate_presence_of(:name) }

    it { should validate_uniqueness_of(:name) }
  end
end

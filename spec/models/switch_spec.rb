require 'rails_helper'

RSpec.describe Switch, type: :model do
  context 'associations' do
    it { should belong_to(:account) }

    it { should have_many(:ports).dependent(:destroy) }
  end


  subject { create(:switch) }

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:mac_address) }

    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:mac_address) }
  end
end

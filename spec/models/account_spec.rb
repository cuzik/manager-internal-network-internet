require 'rails_helper'

RSpec.describe Account, type: :model do
  context 'associations' do
    it { should have_many(:computers).dependent(:destroy) }
    it { should have_many(:users).dependent(:destroy) }
    it { should have_many(:rooms).dependent(:destroy) }
    it { should have_many(:switches).dependent(:destroy) }
    it { should have_many(:ports).through(:switches) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }

    it { should validate_uniqueness_of(:name) }
  end
end

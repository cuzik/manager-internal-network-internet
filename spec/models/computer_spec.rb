require 'rails_helper'

RSpec.describe Computer, type: :model do
  context 'associations' do
    it { should belong_to(:account) }
    it { should belong_to(:port).optional }
    it { should belong_to(:room).optional }

    it { should have_one(:switch).through(:port) }
  end


  subject { create(:computer) }

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:mac_address) }
    it { should validate_presence_of(:ip) }

    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:mac_address) }
    it { should validate_uniqueness_of(:ip).case_insensitive }
    it { should validate_uniqueness_of(:port_id) }
  end
end

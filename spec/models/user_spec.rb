require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { should belong_to(:account) }
  end

  subject { create(:user) }

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:cpf) }

    it { should validate_uniqueness_of(:cpf).case_insensitive }
  end
end

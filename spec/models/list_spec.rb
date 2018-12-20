require 'rails_helper'

RSpec.describe List, type: :model do
  it 'has a valid factory' do
    expect(build(:list)).to be_valid
  end

  let(:list) {build(:list)}

  describe 'Active Model' do
    it 'has validation of name presence' do
      expect(list).to validate_presence_of(:name)
    end
  end

  describe 'Active Records associations' do
    it { expect(list).to belong_to(:user) }
  end
end

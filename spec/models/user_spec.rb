require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  let(:user) { build(:user) }

  describe 'Active Record associations' do
    it { expect(user).to have_many(:lists) }
  end
end

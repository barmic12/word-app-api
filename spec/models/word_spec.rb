require 'rails_helper'

RSpec.describe Word, type: :model do

  it 'has a valid factory' do
    expect(build(:word)).to be_valid
  end

  let(:word) { build(:word) }

  describe "ActiveModel validation" do
    it 'has presence of validation' do
      expect(word).to validate_presence_of(:description)
    end
  end
end

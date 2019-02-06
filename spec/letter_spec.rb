# frozen_string_literal: true

require 'letter'

RSpec.describe Letter.new('c') do
  it { is_expected.to have_attributes char: 'C' }

  it '#found? is false if all coordinates are not set' do
    expect(described_class.found?).to be_falsey
  end

  it '#found? is false if one coordinate is not set' do
    described_class.x = 2
    expect(described_class.found?).to be_falsey
  end

  it '#found? is true if both coordinates are set' do
    described_class.y = 1
    described_class.x = 2
    expect(described_class.found?).to be_truthy
  end

  context Letter.new('C', 1, 2) do
    it { is_expected.to have_attributes char: 'C' }

    it '#found? is true if corrdinates are set' do
      expect(described_class.found?).to be_truthy
    end
  end
end

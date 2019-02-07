# frozen_string_literal: true

require 'word_search/common/coordinates'
require 'word_search/common/letter'

RSpec.describe WordSearch::Common::Letter.new('c') do
  it { is_expected.to have_attributes char: 'C' }

  it '#found? is false if all coordinates are not set' do
    expect(described_class.found?).to be_falsey
  end

  it '#found? is false if one coordinate is not set' do
    described_class.location = WordSearch::Common::Coordinates.new(3)
    expect(described_class.found?).to be_falsey
  end

  it '#found? is true if both coordinates are set' do
    described_class.location = WordSearch::Common::Coordinates.new(1, 2)
    expect(described_class.found?).to be_truthy
  end

  context WordSearch::Common::Letter.new('C', 1, 2) do
    it { is_expected.to have_attributes char: 'C' }

    it '#found? is true if corrdinates are set' do
      expect(described_class.found?).to be_truthy
    end
  end
end

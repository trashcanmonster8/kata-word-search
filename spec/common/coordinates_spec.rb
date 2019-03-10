# frozen_string_literal: true

require 'word_search/common/coordinates'

RSpec.describe WordSearch::Common::Coordinates.new do
  it { is_expected.to have_attributes x: nil, y: nil }

  it '@set? is false' do
    expect(described_class.set?).to eq false
  end

  context WordSearch::Common::Coordinates.new(6) do
    it '@set? is false' do
      expect(described_class.set?).to eq false
    end
  end

  context WordSearch::Common::Coordinates.new(3, 4) do
    it { is_expected.to have_attributes x: 3, y: 4 }

    it '#[] returns coordinates like Array' do
      expect(described_class[0]).to eq 3
      expect(described_class[1]).to eq 4
    end

    it '#equal? is true if all coordinates are equal' do
      expect(described_class).to eq WordSearch::Common::Coordinates.new(3, 4)
      expect(described_class)
        .to_not eq WordSearch::Common::Coordinates.new(4, 3)
    end

    it '@set? is true' do
      expect(described_class.set?).to eq true
    end

    it '#inspect' do
      expect(described_class.inspect).to eq '(3, 4)'
    end
  end
end

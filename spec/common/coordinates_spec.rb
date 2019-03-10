# frozen_string_literal: true

require 'word_search/common/coordinates'

RSpec.describe WordSearch::Common::Coordinates do
  context 'empty coordinates' do
    subject { WordSearch::Common::Coordinates.new }

    it { is_expected.to have_attributes x: nil, y: nil }
    it { is_expected.to_not be_set }
  end

  context 'one coorindate is set' do
    subject { WordSearch::Common::Coordinates.new(6) }

    it { is_expected.to_not be_set }
  end

  context 'set all coordinates' do
    subject { WordSearch::Common::Coordinates.new(3, 4) }

    it { is_expected.to have_attributes x: 3, y: 4 }
    it { is_expected.to eq [3, 4] }
    it { is_expected.to eq WordSearch::Common::Coordinates.new(3, 4) }
    it { is_expected.to_not eq WordSearch::Common::Coordinates.new(4, 3) }
    it { is_expected.to be_set }

    it '#inspect' do
      expect(subject.inspect).to eq '(3, 4)'
    end
  end
end

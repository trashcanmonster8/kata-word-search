# frozen_string_literal: true

require 'word_search/common/coordinates'
require 'word_search/common/letter'

RSpec.describe WordSearch::Common::Letter do
  context 'no coordinates' do
    subject { WordSearch::Common::Letter.new('c') }

    it { is_expected.to have_attributes char: 'C' }
    it { is_expected.to eq letter('C') }
    it { is_expected.to_not eq letter('B') }
    it { is_expected.to_not eq 'B' }
    it { is_expected.to eq 'c' }
    it { is_expected.to_not be_found }

    it '#found? is false if one coordinate is not set' do
      subject.location = WordSearch::Common::Coordinates.new(3)
      is_expected.to_not be_found
    end

    it '#found? is true if both coordinates are set' do
      subject.location = WordSearch::Common::Coordinates.new(1, 2)
      expect(subject.found?).to be_truthy
    end
  end

  context 'given coordinates' do
    subject { WordSearch::Common::Letter.new('C', 1, 2) }
    it { is_expected.to have_attributes char: 'C' }
    it { is_expected.to eq letter('C', 1, 2) }
    it { is_expected.to_not eq letter('C', 2, 2) }
    it { is_expected.to_not eq 'B' }
    it { is_expected.to eq 'c' }
    it { is_expected.to be_found }

    it '#inspect' do
      expect(subject.inspect). to eq 'C, (1,2)'
    end
  end
end

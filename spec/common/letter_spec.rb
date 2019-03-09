# frozen_string_literal: true

require 'word_search/common/coordinates'
require 'word_search/common/letter'

RSpec.describe WordSearch::Common::Letter do
  subject { WordSearch::Common::Letter.new('c') }

  it { is_expected.to have_attributes char: 'C' }

  it '#== if char and coordinates are the same' do
    is_expected.to eq letter('C')
  end

  it '#== if char is not the same' do
    is_expected.to_not eq letter('B')
  end

  it '#found? is false if all coordinates are not set' do
    expect(subject.found?).to be_falsey
  end

  it '#found? is false if one coordinate is not set' do
    subject.location = WordSearch::Common::Coordinates.new(3)
    expect(subject.found?).to be_falsey
  end

  it '#found? is true if both coordinates are set' do
    subject.location = WordSearch::Common::Coordinates.new(1, 2)
    expect(subject.found?).to be_truthy
  end

  context 'given coordinates' do
    subject { WordSearch::Common::Letter.new('C', 1, 2) }
    it { is_expected.to have_attributes char: 'C' }

    it '#found? is true if corrdinates are set' do
      expect(subject.found?).to be_truthy
    end

    it '#== if char and coordinates are the same' do
      is_expected.to eq letter('C', 1, 2)
    end

    it '#== if coordinates are not the same' do
      is_expected.to_not eq letter('C', 2, 2)
    end
  end
end

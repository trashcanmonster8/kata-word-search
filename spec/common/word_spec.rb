# frozen_string_literal: true

require 'word_search/common/letter'
require 'word_search/common/word'

RSpec.describe WordSearch::Common::Word do
  subject { WordSearch::Common::Word.new('test') }

  it '#found? is false if any letters are not found' do
    expect(subject.found?).to eq false
  end

  it '#to_s prints @raw' do
    expect(subject.to_s).to eq 'TEST'
  end

  it '#== only compares @raw' do
    other = WordSearch::Common::Word.new('test')
    is_expected.to eq other
  end

  it '#== compares string without reference to case' do
    other = 'test'
    is_expected.to eq other
  end

  it '#== compares string without reference to case' do
    other = 'testing'
    is_expected.to_not eq other
  end

  it '#size give length of word' do
    expect(subject.size).to eq 4
  end

  it '#[]' do
    expect(subject[1]).to be_a WordSearch::Common::Letter
  end

  context 'letter is given coordinates' do
    subject { WordSearch::Common::Word.new('w') }

    before do
      subject[0].location = WordSearch::Common::Coordinates.new(3, 5)
    end

    it '#found? is true if all letters are found' do
      expect(subject.found?).to eq true
    end

    it '#inspect' do
      expect(subject.inspect).to eq 'W: (3, 5)'
    end
  end

  context 'no paramters' do
    subject { WordSearch::Common::Word.new.join(line(0..3)) }

    it { is_expected.to eq 'ABCD' }
    it { is_expected.to be_found }
  end
end

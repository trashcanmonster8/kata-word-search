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
    expect(subject).to eq other
  end

  it '#size give length of word' do
    expect(subject.size).to eq 4
  end

  it '#parse creates an array of Letters' do
    expect(subject.parse).to be_a Array
    expect(subject.parse[0]).to be_a WordSearch::Common::Letter
  end

  it '#[]' do
    subject.parse
    expect(subject[1]).to be_a WordSearch::Common::Letter
  end

  it '#parse does not overwrite changes to :parse' do
    subject.instance_variable_set(:@parse, [:bad_object])
    subject.parse
    expect(subject[0]).to eq :bad_object
  end

  context 'letter is given coordinates' do
    subject { WordSearch::Common::Word.new('w') }
    it '#found? is true if all letters are found' do
      subject[0].location = WordSearch::Common::Coordinates.new(3, 5)
      expect(subject.found?).to eq true
    end
  end

  context 'no paramters' do
    subject { WordSearch::Common::Word.new.join(line(0..3)) }

    it { is_expected.to eq 'ABCD' }
    it { is_expected.to be_found }
  end
end

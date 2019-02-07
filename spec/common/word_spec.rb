# frozen_string_literal: true

require 'word_search/common/letter'
require 'word_search/common/word'

RSpec.describe WordSearch::Common::Word.new('test') do
  it '#found? is false if any letters are not found' do
    expect(described_class.found?).to eq false
  end

  it '#parse creates an array of Letters' do
    expect(described_class.parse).to be_a Array
    expect(described_class.parse[0]).to be_a WordSearch::Common::Letter
  end

  it '#[]' do
    described_class.parse
    expect(described_class[1]).to be_a WordSearch::Common::Letter
  end

  it '#parse does not overwrite changes to :parse' do
    described_class.instance_variable_set(:@parse, [:bad_object])
    described_class.parse
    expect(described_class[0]).to eq :bad_object
  end

  context WordSearch::Common::Word.new('w') do
    it '#found? is true if all letters are found' do
      described_class[0].x = 1
      described_class[0].y = 2
      expect(described_class.found?).to eq true
    end
  end
end

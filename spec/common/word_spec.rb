# frozen_string_literal: true

require 'word_search/common/letter'
require 'word_search/common/word'

RSpec.describe WordSearch::Common::Word do
  context 'word with no coordinates' do
    subject { WordSearch::Common::Word.new('test') }

    it { is_expected.to_not be_found }
    it { is_expected.to eq WordSearch::Common::Word.new('test') }
    it { is_expected.to eq 'test' }
    it { is_expected.to_not eq 'testing' }

    it '#to_s prints @raw' do
      expect(subject.to_s).to eq 'TEST'
    end

    it '#[]' do
      expect(subject[1]).to eq WordSearch::Common::Letter.new('e')
    end

    it '#size give length of word' do
      expect(subject.size).to eq 4
    end

    it '#inspect' do
      expect(subject.inspect).to eq 'TEST'
    end
  end

  context 'letter is given coordinates' do
    subject { WordSearch::Common::Word.new('w') }

    before do
      subject[0].location = WordSearch::Common::Coordinates.new(3, 5)
    end

    it { is_expected.to be_found }

    it '#inspect' do
      expect(subject.inspect).to eq 'W: (3,5)'
    end
  end

  context 'no paramters' do
    subject { WordSearch::Common::Word.new.join(line(0..3)) }

    it { is_expected.to eq 'ABCD' }
    it { is_expected.to be_found }

    it '#inspect' do
      expect(subject.inspect).to eq 'ABCD: (0,1),(1,2),(2,3),(3,4)'
    end

    it '#inspect does not add to output after multiple executions' do
      subject.inspect
      expect(subject.inspect).to eq 'ABCD: (0,1),(1,2),(2,3),(3,4)'
    end
  end
end

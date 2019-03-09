# frozen_string_literal: true

require 'word_search/finder'

RSpec.describe WordSearch::Finder do
  subject { WordSearch::Finder.new(line(0..13), query) }
  let(:query) { 'hi' }

  it '#permute sorts line into different possible permutations' do
    expect(subject.permute(1)[0][10]).to eq [letter('k', 10, 11)]
  end

  it '#permute modulo 2' do
    expect(subject.permute(2)[0][2]).to eq line(4..5)
  end

  it '#permute modulo 3' do
    expect(subject.permute(3)[2][0]).to eq line(2..4)
  end

  it '#permute module 7' do
    expect(subject.permute(7)[5][0]).to match_array line(5..11)
  end

  it '#finds word' do
    subject.find
    expect(subject.word).to eq word(7..8)
  end
end

# frozen_string_literal: true

require 'word'

RSpec.describe Word.new('test') do
  it '#found? reads :found' do
    expect(described_class.found?).to eq false
  end

  it '#found! sets :found to true' do
    described_class.found!
    expect(described_class.found?).to eq true
  end

  it '#parse creates an array of Letters' do
    expect(described_class.parse).to be_a Array
    expect(described_class.parse[0]).to be_a Letter
  end

  it '#[]' do
    described_class.parse
    expect(described_class[1]).to be_a Letter
  end

  it '#parse does not overwrite changes to :parse' do
    described_class.instance_variable_set(:@parse, [:bad_object])
    described_class.parse
    expect(described_class[0]).to eq :bad_object
  end
end

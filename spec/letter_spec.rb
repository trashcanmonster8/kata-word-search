# frozen_string_literal: true

require 'letter'

RSpec.describe Letter.new('c') do
  it { is_expected.to have_attributes char: 'C', x: nil, y: nil }

  it '#x= sets x corrdinates' do
    described_class.x = 1
    expect(described_class.x).to eq 1
  end

  it '#y= sets y corrdinates' do
    described_class.y = 1
    expect(described_class.y).to eq 1
  end

  context Letter.new('C', 1, 2) do
    it { is_expected.to have_attributes char: 'C', x: 1, y: 2 }
  end
end

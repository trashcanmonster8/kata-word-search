# frozen_string_literal: true

require 'coordinate'

RSpec.describe Coordinate.new do
  it { is_expected.to have_attributes x: nil, y: nil }

  it '#x=' do
    described_class.x = 2
    expect(described_class.x).to eql 2
  end
end

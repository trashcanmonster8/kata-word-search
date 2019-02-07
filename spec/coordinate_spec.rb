# frozen_string_literal: true

require 'coordinate'

RSpec.describe Coordinate.new do
  it { is_expected.to have_attributes x: nil, y: nil }

  context Coordinate.new(3, 4) do
    it { is_expected.to have_attributes x: 3, y: 4 }
  end
end

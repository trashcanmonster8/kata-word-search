# frozen_string_literal: true

require 'word_search/common/coordinate'

RSpec.describe WordSearch::Common::Coordinate.new do
  it { is_expected.to have_attributes x: nil, y: nil }

  context WordSearch::Common::Coordinate.new(3, 4) do
    it { is_expected.to have_attributes x: 3, y: 4 }
  end
end

# frozen_string_literal: true

require 'rspec'
require 'letter'

RSpec.describe Letter do
  it { is_expected.to have_attributes char: '', x: nil, y: nil }

  context Letter.new('c') do
    it { is_expected.to have_attributes char: 'C', x: nil, y: nil }
  end

  context Letter.new('C', 1, 2) do
    it { is_expected.to have_attributes char: 'C', x: 1, y: 2 }
  end
end

# frozen_string_literal: true

require 'rspec'
require 'letter'

RSpec.describe Letter do
  it { is_expected.to have_attributes char: nil, x: nil, y: nil }
end

# frozen_string_literal: true

require 'rspec'
require 'word'

RSpec.describe Word do
  it { is_expected.to have_attributes raw: nil }
end

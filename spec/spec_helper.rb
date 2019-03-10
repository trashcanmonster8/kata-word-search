# frozen_string_literal: true

require 'bundler\setup'
require './spec/helpers/puzzle_helpers'

Bundler.setup

RSpec.configure do |config|
  config.include PuzzleHelpers
  config.extend PuzzleHelpers

  config.mock_with :rspec do |mocks|
    mocks.verify_doubled_constant_names = true
  end
end

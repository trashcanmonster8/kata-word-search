# frozen_string_literal: true

require 'bundler\setup'
require './spec/helpers/puzzle_helpers'

Bundler.setup

RSpec.configure do |c|
  c.include PuzzleHelpers
  c.extend PuzzleHelpers
end

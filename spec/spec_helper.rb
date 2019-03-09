# frozen_string_literal: true

require 'bundler\setup'
require './spec/helpers/line_helpers'

Bundler.setup

RSpec.configure do |c|
  c.include LineHelpers
  c.extend LineHelpers
end

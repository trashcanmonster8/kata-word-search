# frozen_string_literal: true

require 'word'

RSpec.describe Word.new('test') do
  it { is_expected.to have_attributes raw: 'test' }
end

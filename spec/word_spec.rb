# frozen_string_literal: true

require 'word'

RSpec.describe Word.new('test') do
  it do
    is_expected.to have_attributes(raw: 'test')
  end

  it '#parse' do
    expect(described_class.parse).to be_a Array
    expect(described_class.parse[0]).to be_a Letter
  end
end

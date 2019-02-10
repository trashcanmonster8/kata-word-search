# frozen_string_literal: true

module WordSearch
  #
  # Finds a word in a line of letters
  #
  class Finder
    attr_reader :permutations

    def initialize(line, word)
      @line = line
      @modulus = word.size
      @permutations = []
    end

    def permute
      groups = @line.size.div(@modulus)
      @permutations = (0..(@modulus - 1)).collect do |shift|
        line = @line.clone
        line.shift(shift)
        (0..groups).collect do
          next if line.size < @modulus

          line.shift(@modulus).join
        end.compact
      end
    end
  end
end

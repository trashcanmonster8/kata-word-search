# frozen_string_literal: true

module WordSearch
  #
  # Takes an array and creates all permutations
  # of modulus with no remainders
  #
  class Permuter
    attr_reader :permutations

    def initialize(line, modulus)
      @line = line
      @modulus = modulus
      @permutations = []
    end

    def permute
      groups = @line.size / @modulus

      (1..groups).each do |index|
        @permutations[index - 1] = @line.shift(@modulus).join
      end
      @permutations
    end
  end
end

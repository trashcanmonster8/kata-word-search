module WordSearch
    # 
    # Takes an array and creates all permutations
    # of modulus with no remainders
    # 
    class Permuter
        attr_reader :permutations

        def initialize(line, modulus)
            @line = line
            @moduleus = modulus
            @permutations = []
        end
    end
end

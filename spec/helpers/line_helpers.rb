module LineHelpers
  def line(range)
    range.collect { |i| WordSearch::Common::Letter.new((i + 97).chr, i, i + 1) }
  end

  def word(range)
    WordSearch::Common::Word.new.join(line(range))
  end
end

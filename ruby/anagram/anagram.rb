class Anagram
  def initialize(word)
    @word = word
    @sorted = @word.upcase.chars.sort
  end

  def match(testlist)
    testlist.filter do |w|
      w.size == @word.size &&
        w.upcase != @word.upcase &&
        w.upcase.chars.sort == @sorted
    end
  end
end
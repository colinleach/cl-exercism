class Anagram
  def self.find(word, testlist)
    return testlist.select() { |w| w if self.isAnagram?(word, w) }
  end

  def self.isAnagram?(w1, w2)
    if w1.size != w2.size || w1.upcase == w2.upcase
      return false
    end
    letters1 = w1.upcase.chars.sort()
    letters2 = w2.upcase.chars.sort()
    return letters1 == letters2
  end
end

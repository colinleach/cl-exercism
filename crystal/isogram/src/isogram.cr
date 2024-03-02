module Isogram
  def self.isogram?(phrase : String) : Bool
    letters = phrase.downcase.chars.
      select! { |c| ('a'..'z').to_a.includes?(c) }
    letters.size == letters.to_set.size
  end
end
